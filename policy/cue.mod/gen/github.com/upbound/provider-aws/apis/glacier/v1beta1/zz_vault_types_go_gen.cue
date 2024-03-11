// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/glacier/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#NotificationInitParameters: {
	// You can configure a vault to publish a notification for ArchiveRetrievalCompleted and InventoryRetrievalCompleted events.
	events?: [...null | string] @go(Events,[]*string)
}

#NotificationObservation: {
	// You can configure a vault to publish a notification for ArchiveRetrievalCompleted and InventoryRetrievalCompleted events.
	events?: [...null | string] @go(Events,[]*string)

	// The SNS Topic ARN.
	snsTopic?: null | string @go(SnsTopic,*string)
}

#NotificationParameters: {
	// You can configure a vault to publish a notification for ArchiveRetrievalCompleted and InventoryRetrievalCompleted events.
	// +kubebuilder:validation:Optional
	events: [...null | string] @go(Events,[]*string)

	// The SNS Topic ARN.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/sns/v1beta1.Topic
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	snsTopic?: null | string @go(SnsTopic,*string)

	// Reference to a Topic in sns to populate snsTopic.
	// +kubebuilder:validation:Optional
	snsTopicRef?: null | v1.#Reference @go(SnsTopicRef,*v1.Reference)

	// Selector for a Topic in sns to populate snsTopic.
	// +kubebuilder:validation:Optional
	snsTopicSelector?: null | v1.#Selector @go(SnsTopicSelector,*v1.Selector)
}

#VaultInitParameters: {
	// The policy document. This is a JSON formatted string.
	// The heredoc syntax or file function is helpful here. Use the Glacier Developer Guide for more information on Glacier Vault Policy
	accessPolicy?: null | string @go(AccessPolicy,*string)

	// The notifications for the Vault. Fields documented below.
	notification?: [...#NotificationInitParameters] @go(Notification,[]NotificationInitParameters)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#VaultObservation: {
	// The policy document. This is a JSON formatted string.
	// The heredoc syntax or file function is helpful here. Use the Glacier Developer Guide for more information on Glacier Vault Policy
	accessPolicy?: null | string @go(AccessPolicy,*string)

	// The ARN of the vault.
	arn?: null | string @go(Arn,*string)
	id?:  null | string @go(ID,*string)

	// The URI of the vault that was created.
	location?: null | string @go(Location,*string)

	// The notifications for the Vault. Fields documented below.
	notification?: [...#NotificationObservation] @go(Notification,[]NotificationObservation)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#VaultParameters: {
	// The policy document. This is a JSON formatted string.
	// The heredoc syntax or file function is helpful here. Use the Glacier Developer Guide for more information on Glacier Vault Policy
	// +kubebuilder:validation:Optional
	accessPolicy?: null | string @go(AccessPolicy,*string)

	// The notifications for the Vault. Fields documented below.
	// +kubebuilder:validation:Optional
	notification?: [...#NotificationParameters] @go(Notification,[]NotificationParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// VaultSpec defines the desired state of Vault
#VaultSpec: {
	v1.#ResourceSpec
	forProvider: #VaultParameters @go(ForProvider)

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
	initProvider?: #VaultInitParameters @go(InitProvider)
}

// VaultStatus defines the observed state of Vault.
#VaultStatus: {
	v1.#ResourceStatus
	atProvider?: #VaultObservation @go(AtProvider)
}

// Vault is the Schema for the Vaults API. Provides a Glacier Vault.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Vault: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #VaultSpec         @go(Spec)
	status?:   #VaultStatus       @go(Status)
}

// VaultList contains a list of Vaults
#VaultList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Vault] @go(Items,[]Vault)
}
