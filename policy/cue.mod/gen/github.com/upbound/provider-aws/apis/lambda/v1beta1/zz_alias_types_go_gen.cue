// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/lambda/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#AliasInitParameters: {
	// Description of the alias.
	description?: null | string @go(Description,*string)

	// Lambda function version for which you are creating the alias. Pattern: (\$LATEST|[0-9]+).
	functionVersion?: null | string @go(FunctionVersion,*string)

	// The Lambda alias' route configuration settings. Fields documented below
	routingConfig?: [...#RoutingConfigInitParameters] @go(RoutingConfig,[]RoutingConfigInitParameters)
}

#AliasObservation: {
	// The Amazon Resource Name (ARN) identifying your Lambda function alias.
	arn?: null | string @go(Arn,*string)

	// Description of the alias.
	description?: null | string @go(Description,*string)

	// Lambda Function name or ARN.
	functionName?: null | string @go(FunctionName,*string)

	// Lambda function version for which you are creating the alias. Pattern: (\$LATEST|[0-9]+).
	functionVersion?: null | string @go(FunctionVersion,*string)
	id?:              null | string @go(ID,*string)

	// The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri
	invokeArn?: null | string @go(InvokeArn,*string)

	// The Lambda alias' route configuration settings. Fields documented below
	routingConfig?: [...#RoutingConfigObservation] @go(RoutingConfig,[]RoutingConfigObservation)
}

#AliasParameters: {
	// Description of the alias.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// Lambda Function name or ARN.
	// +crossplane:generate:reference:type=Function
	// +kubebuilder:validation:Optional
	functionName?: null | string @go(FunctionName,*string)

	// Reference to a Function to populate functionName.
	// +kubebuilder:validation:Optional
	functionNameRef?: null | v1.#Reference @go(FunctionNameRef,*v1.Reference)

	// Selector for a Function to populate functionName.
	// +kubebuilder:validation:Optional
	functionNameSelector?: null | v1.#Selector @go(FunctionNameSelector,*v1.Selector)

	// Lambda function version for which you are creating the alias. Pattern: (\$LATEST|[0-9]+).
	// +kubebuilder:validation:Optional
	functionVersion?: null | string @go(FunctionVersion,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The Lambda alias' route configuration settings. Fields documented below
	// +kubebuilder:validation:Optional
	routingConfig?: [...#RoutingConfigParameters] @go(RoutingConfig,[]RoutingConfigParameters)
}

#RoutingConfigInitParameters: {
	// A map that defines the proportion of events that should be sent to different versions of a lambda function.
	additionalVersionWeights?: {[string]: null | float64} @go(AdditionalVersionWeights,map[string]*float64)
}

#RoutingConfigObservation: {
	// A map that defines the proportion of events that should be sent to different versions of a lambda function.
	additionalVersionWeights?: {[string]: null | float64} @go(AdditionalVersionWeights,map[string]*float64)
}

#RoutingConfigParameters: {
	// A map that defines the proportion of events that should be sent to different versions of a lambda function.
	// +kubebuilder:validation:Optional
	additionalVersionWeights?: {[string]: null | float64} @go(AdditionalVersionWeights,map[string]*float64)
}

// AliasSpec defines the desired state of Alias
#AliasSpec: {
	v1.#ResourceSpec
	forProvider: #AliasParameters @go(ForProvider)

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
	initProvider?: #AliasInitParameters @go(InitProvider)
}

// AliasStatus defines the observed state of Alias.
#AliasStatus: {
	v1.#ResourceStatus
	atProvider?: #AliasObservation @go(AtProvider)
}

// Alias is the Schema for the Aliass API. Creates a Lambda function alias.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#Alias: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.functionVersion) || (has(self.initProvider) && has(self.initProvider.functionVersion))",message="spec.forProvider.functionVersion is a required parameter"
	spec:    #AliasSpec   @go(Spec)
	status?: #AliasStatus @go(Status)
}

// AliasList contains a list of Aliass
#AliasList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Alias] @go(Items,[]Alias)
}
