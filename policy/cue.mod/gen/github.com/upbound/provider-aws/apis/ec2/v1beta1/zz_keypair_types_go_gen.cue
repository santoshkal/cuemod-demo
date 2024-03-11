// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#KeyPairInitParameters: {
	// The public key material.
	publicKey?: null | string @go(PublicKey,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#KeyPairObservation: {
	// The key pair ARN.
	arn?: null | string @go(Arn,*string)

	// The MD5 public key fingerprint as specified in section 4 of RFC 4716.
	fingerprint?: null | string @go(Fingerprint,*string)

	// The key pair name.
	id?: null | string @go(ID,*string)

	// The key pair ID.
	keyPairId?: null | string @go(KeyPairID,*string)

	// The type of key pair.
	keyType?: null | string @go(KeyType,*string)

	// The public key material.
	publicKey?: null | string @go(PublicKey,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#KeyPairParameters: {
	// The public key material.
	// +kubebuilder:validation:Optional
	publicKey?: null | string @go(PublicKey,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// KeyPairSpec defines the desired state of KeyPair
#KeyPairSpec: {
	v1.#ResourceSpec
	forProvider: #KeyPairParameters @go(ForProvider)

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
	initProvider?: #KeyPairInitParameters @go(InitProvider)
}

// KeyPairStatus defines the observed state of KeyPair.
#KeyPairStatus: {
	v1.#ResourceStatus
	atProvider?: #KeyPairObservation @go(AtProvider)
}

// KeyPair is the Schema for the KeyPairs API. Provides a Key Pair resource. Currently this supports importing an existing key pair but not creating a new key pair.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#KeyPair: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.publicKey) || (has(self.initProvider) && has(self.initProvider.publicKey))",message="spec.forProvider.publicKey is a required parameter"
	spec:    #KeyPairSpec   @go(Spec)
	status?: #KeyPairStatus @go(Status)
}

// KeyPairList contains a list of KeyPairs
#KeyPairList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#KeyPair] @go(Items,[]KeyPair)
}
