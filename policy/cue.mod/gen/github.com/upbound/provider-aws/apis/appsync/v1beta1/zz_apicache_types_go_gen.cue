// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/appsync/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#APICacheInitParameters: {
	// Caching behavior. Valid values are FULL_REQUEST_CACHING and PER_RESOLVER_CACHING.
	apiCachingBehavior?: null | string @go(APICachingBehavior,*string)

	// At-rest encryption flag for cache. You cannot update this setting after creation.
	atRestEncryptionEnabled?: null | bool @go(AtRestEncryptionEnabled,*bool)

	// TTL in seconds for cache entries.
	ttl?: null | float64 @go(TTL,*float64)

	// Transit encryption flag when connecting to cache. You cannot update this setting after creation.
	transitEncryptionEnabled?: null | bool @go(TransitEncryptionEnabled,*bool)

	// Cache instance type. Valid values are SMALL, MEDIUM, LARGE, XLARGE, LARGE_2X, LARGE_4X, LARGE_8X, LARGE_12X, T2_SMALL, T2_MEDIUM, R4_LARGE, R4_XLARGE, R4_2XLARGE, R4_4XLARGE, R4_8XLARGE.
	type?: null | string @go(Type,*string)
}

#APICacheObservation: {
	// Caching behavior. Valid values are FULL_REQUEST_CACHING and PER_RESOLVER_CACHING.
	apiCachingBehavior?: null | string @go(APICachingBehavior,*string)

	// GraphQL API ID.
	apiId?: null | string @go(APIID,*string)

	// At-rest encryption flag for cache. You cannot update this setting after creation.
	atRestEncryptionEnabled?: null | bool @go(AtRestEncryptionEnabled,*bool)

	// AppSync API ID.
	id?: null | string @go(ID,*string)

	// TTL in seconds for cache entries.
	ttl?: null | float64 @go(TTL,*float64)

	// Transit encryption flag when connecting to cache. You cannot update this setting after creation.
	transitEncryptionEnabled?: null | bool @go(TransitEncryptionEnabled,*bool)

	// Cache instance type. Valid values are SMALL, MEDIUM, LARGE, XLARGE, LARGE_2X, LARGE_4X, LARGE_8X, LARGE_12X, T2_SMALL, T2_MEDIUM, R4_LARGE, R4_XLARGE, R4_2XLARGE, R4_4XLARGE, R4_8XLARGE.
	type?: null | string @go(Type,*string)
}

#APICacheParameters: {
	// Caching behavior. Valid values are FULL_REQUEST_CACHING and PER_RESOLVER_CACHING.
	// +kubebuilder:validation:Optional
	apiCachingBehavior?: null | string @go(APICachingBehavior,*string)

	// GraphQL API ID.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/appsync/v1beta1.GraphQLAPI
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	apiId?: null | string @go(APIID,*string)

	// Reference to a GraphQLAPI in appsync to populate apiId.
	// +kubebuilder:validation:Optional
	apiIdRef?: null | v1.#Reference @go(APIIDRef,*v1.Reference)

	// Selector for a GraphQLAPI in appsync to populate apiId.
	// +kubebuilder:validation:Optional
	apiIdSelector?: null | v1.#Selector @go(APIIDSelector,*v1.Selector)

	// At-rest encryption flag for cache. You cannot update this setting after creation.
	// +kubebuilder:validation:Optional
	atRestEncryptionEnabled?: null | bool @go(AtRestEncryptionEnabled,*bool)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// TTL in seconds for cache entries.
	// +kubebuilder:validation:Optional
	ttl?: null | float64 @go(TTL,*float64)

	// Transit encryption flag when connecting to cache. You cannot update this setting after creation.
	// +kubebuilder:validation:Optional
	transitEncryptionEnabled?: null | bool @go(TransitEncryptionEnabled,*bool)

	// Cache instance type. Valid values are SMALL, MEDIUM, LARGE, XLARGE, LARGE_2X, LARGE_4X, LARGE_8X, LARGE_12X, T2_SMALL, T2_MEDIUM, R4_LARGE, R4_XLARGE, R4_2XLARGE, R4_4XLARGE, R4_8XLARGE.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

// APICacheSpec defines the desired state of APICache
#APICacheSpec: {
	v1.#ResourceSpec
	forProvider: #APICacheParameters @go(ForProvider)

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
	initProvider?: #APICacheInitParameters @go(InitProvider)
}

// APICacheStatus defines the observed state of APICache.
#APICacheStatus: {
	v1.#ResourceStatus
	atProvider?: #APICacheObservation @go(AtProvider)
}

// APICache is the Schema for the APICaches API. Provides an AppSync API Cache.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#APICache: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.apiCachingBehavior) || (has(self.initProvider) && has(self.initProvider.apiCachingBehavior))",message="spec.forProvider.apiCachingBehavior is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.ttl) || (has(self.initProvider) && has(self.initProvider.ttl))",message="spec.forProvider.ttl is a required parameter"
	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.type) || (has(self.initProvider) && has(self.initProvider.type))",message="spec.forProvider.type is a required parameter"
	spec:    #APICacheSpec   @go(Spec)
	status?: #APICacheStatus @go(Status)
}

// APICacheList contains a list of APICaches
#APICacheList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#APICache] @go(Items,[]APICache)
}
