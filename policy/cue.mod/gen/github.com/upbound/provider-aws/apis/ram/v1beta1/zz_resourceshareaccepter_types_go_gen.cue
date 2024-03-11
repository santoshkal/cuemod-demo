// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ram/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#ResourceShareAccepterInitParameters: {
}

#ResourceShareAccepterObservation: {
	id?: null | string @go(ID,*string)

	// The ARN of the resource share invitation.
	invitationArn?: null | string @go(InvitationArn,*string)

	// The account ID of the receiver account which accepts the invitation.
	receiverAccountId?: null | string @go(ReceiverAccountID,*string)

	// A list of the resource ARNs shared via the resource share.
	resources?: [...null | string] @go(Resources,[]*string)

	// The account ID of the sender account which submits the invitation.
	senderAccountId?: null | string @go(SenderAccountID,*string)

	// The ARN of the resource share.
	shareArn?: null | string @go(ShareArn,*string)

	// The ID of the resource share as displayed in the console.
	shareId?: null | string @go(ShareID,*string)

	// The name of the resource share.
	shareName?: null | string @go(ShareName,*string)

	// The status of the resource share (ACTIVE, PENDING, FAILED, DELETING, DELETED).
	status?: null | string @go(Status,*string)
}

#ResourceShareAccepterParameters: {
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The ARN of the resource share.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ram/v1beta1.PrincipalAssociation
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("resource_share_arn",false)
	// +kubebuilder:validation:Optional
	shareArn?: null | string @go(ShareArn,*string)

	// Reference to a PrincipalAssociation in ram to populate shareArn.
	// +kubebuilder:validation:Optional
	shareArnRef?: null | v1.#Reference @go(ShareArnRef,*v1.Reference)

	// Selector for a PrincipalAssociation in ram to populate shareArn.
	// +kubebuilder:validation:Optional
	shareArnSelector?: null | v1.#Selector @go(ShareArnSelector,*v1.Selector)
}

// ResourceShareAccepterSpec defines the desired state of ResourceShareAccepter
#ResourceShareAccepterSpec: {
	v1.#ResourceSpec
	forProvider: #ResourceShareAccepterParameters @go(ForProvider)

	// THIS IS A BETA FIELD. It will be honored
	// unless the Management Policies feature flag is disabled.
	// InitProvider holds the same fields as ForProvider, with the exception
	// of Identifier and other resource reference fields. The fields that are
	// in InitProvider are merged into ForProvider when the resource is created.
	// The same fields are also added to the terraform ignore_changes hook, to
	// avoid updating them after creation. This is useful for fields that are
	// required on creation, but we do not desire to update them after creation,
	// for example because of an external controller is managing them, like an
	// autoscaler.
	initProvider?: #ResourceShareAccepterInitParameters @go(InitProvider)
}

// ResourceShareAccepterStatus defines the observed state of ResourceShareAccepter.
#ResourceShareAccepterStatus: {
	v1.#ResourceStatus
	atProvider?: #ResourceShareAccepterObservation @go(AtProvider)
}

// ResourceShareAccepter is the Schema for the ResourceShareAccepters API. Manages accepting a Resource Access Manager (RAM) Resource Share invitation.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#ResourceShareAccepter: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta           @go(ObjectMeta)
	spec:      #ResourceShareAccepterSpec   @go(Spec)
	status?:   #ResourceShareAccepterStatus @go(Status)
}

// ResourceShareAccepterList contains a list of ResourceShareAccepters
#ResourceShareAccepterList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ResourceShareAccepter] @go(Items,[]ResourceShareAccepter)
}
