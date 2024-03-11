// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/servicecatalog/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#TagOptionInitParameters: {
	// Whether tag option is active. Default is true.
	active?: null | bool @go(Active,*bool)

	// Tag option key.
	key?: null | string @go(Key,*string)

	// Tag option value.
	value?: null | string @go(Value,*string)
}

#TagOptionObservation: {
	// Whether tag option is active. Default is true.
	active?: null | bool @go(Active,*bool)

	// Identifier (e.g., tag-pjtvagohlyo3m).
	id?: null | string @go(ID,*string)

	// Tag option key.
	key?:   null | string @go(Key,*string)
	owner?: null | string @go(Owner,*string)

	// Tag option value.
	value?: null | string @go(Value,*string)
}

#TagOptionParameters: {
	// Whether tag option is active. Default is true.
	// +kubebuilder:validation:Optional
	active?: null | bool @go(Active,*bool)

	// Tag option key.
	// +kubebuilder:validation:Optional
	key?: null | string @go(Key,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Tag option value.
	// +kubebuilder:validation:Optional
	value?: null | string @go(Value,*string)
}

// TagOptionSpec defines the desired state of TagOption
#TagOptionSpec: {
	v1.#ResourceSpec
	forProvider: #TagOptionParameters @go(ForProvider)

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
	initProvider?: #TagOptionInitParameters @go(InitProvider)
}

// TagOptionStatus defines the observed state of TagOption.
#TagOptionStatus: {
	v1.#ResourceStatus
	atProvider?: #TagOptionObservation @go(AtProvider)
}

// TagOption is the Schema for the TagOptions API. Manages a Service Catalog Tag Option
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#TagOption: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.key) || (has(self.initProvider) && has(self.initProvider.key))",message="spec.forProvider.key is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.value) || (has(self.initProvider) && has(self.initProvider.value))",message="spec.forProvider.value is a required parameter"
	spec:    #TagOptionSpec   @go(Spec)
	status?: #TagOptionStatus @go(Status)
}

// TagOptionList contains a list of TagOptions
#TagOptionList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TagOption] @go(Items,[]TagOption)
}
