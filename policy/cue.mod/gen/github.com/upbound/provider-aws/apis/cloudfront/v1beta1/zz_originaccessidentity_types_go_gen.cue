// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/cloudfront/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#OriginAccessIdentityInitParameters: {
	// An optional comment for the origin access identity.
	comment?: null | string @go(Comment,*string)
}

#OriginAccessIdentityObservation: {
	// Internal value used by CloudFront to allow future
	// updates to the origin access identity.
	callerReference?: null | string @go(CallerReference,*string)

	// A shortcut to the full path for the
	// origin access identity to use in CloudFront, see below.
	cloudfrontAccessIdentityPath?: null | string @go(CloudfrontAccessIdentityPath,*string)

	// An optional comment for the origin access identity.
	comment?: null | string @go(Comment,*string)

	// The current version of the origin access identity's information.
	// For example: E2QWRUHAPOMQZL.
	etag?: null | string @go(Etag,*string)

	// A pre-generated ARN for use in S3 bucket policies (see below).
	// Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL.
	iamArn?: null | string @go(IAMArn,*string)

	// The identifier for the distribution. For example: EDFDVBD632BHDS5.
	id?: null | string @go(ID,*string)

	// The Amazon S3 canonical user ID for the origin
	// access identity, which you use when giving the origin access identity read
	// permission to an object in Amazon S3.
	s3CanonicalUserId?: null | string @go(S3CanonicalUserID,*string)
}

#OriginAccessIdentityParameters: {
	// An optional comment for the origin access identity.
	// +kubebuilder:validation:Optional
	comment?: null | string @go(Comment,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)
}

// OriginAccessIdentitySpec defines the desired state of OriginAccessIdentity
#OriginAccessIdentitySpec: {
	v1.#ResourceSpec
	forProvider: #OriginAccessIdentityParameters @go(ForProvider)

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
	initProvider?: #OriginAccessIdentityInitParameters @go(InitProvider)
}

// OriginAccessIdentityStatus defines the observed state of OriginAccessIdentity.
#OriginAccessIdentityStatus: {
	v1.#ResourceStatus
	atProvider?: #OriginAccessIdentityObservation @go(AtProvider)
}

// OriginAccessIdentity is the Schema for the OriginAccessIdentitys API. Provides a CloudFront origin access identity.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#OriginAccessIdentity: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta          @go(ObjectMeta)
	spec:      #OriginAccessIdentitySpec   @go(Spec)
	status?:   #OriginAccessIdentityStatus @go(Status)
}

// OriginAccessIdentityList contains a list of OriginAccessIdentitys
#OriginAccessIdentityList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#OriginAccessIdentity] @go(Items,[]OriginAccessIdentity)
}
