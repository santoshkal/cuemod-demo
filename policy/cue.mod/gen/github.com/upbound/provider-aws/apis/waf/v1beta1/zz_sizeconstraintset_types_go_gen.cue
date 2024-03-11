// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/waf/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#SizeConstraintSetInitParameters: {
	// The name or description of the Size Constraint Set.
	name?: null | string @go(Name,*string)

	// Specifies the parts of web requests that you want to inspect the size of.
	sizeConstraints?: [...#SizeConstraintsInitParameters] @go(SizeConstraints,[]SizeConstraintsInitParameters)
}

#SizeConstraintSetObservation: {
	// Amazon Resource Name (ARN)
	arn?: null | string @go(Arn,*string)

	// The ID of the WAF Size Constraint Set.
	id?: null | string @go(ID,*string)

	// The name or description of the Size Constraint Set.
	name?: null | string @go(Name,*string)

	// Specifies the parts of web requests that you want to inspect the size of.
	sizeConstraints?: [...#SizeConstraintsObservation] @go(SizeConstraints,[]SizeConstraintsObservation)
}

#SizeConstraintSetParameters: {
	// The name or description of the Size Constraint Set.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Specifies the parts of web requests that you want to inspect the size of.
	// +kubebuilder:validation:Optional
	sizeConstraints?: [...#SizeConstraintsParameters] @go(SizeConstraints,[]SizeConstraintsParameters)
}

#SizeConstraintsFieldToMatchInitParameters: {
	// When type is HEADER, enter the name of the header that you want to search, e.g., User-Agent or Referer.
	// If type is any other value, omit this field.
	data?: null | string @go(Data,*string)

	// The part of the web request that you want AWS WAF to search for a specified string.
	// e.g., HEADER, METHOD or BODY.
	// See docs
	// for all supported values.
	type?: null | string @go(Type,*string)
}

#SizeConstraintsFieldToMatchObservation: {
	// When type is HEADER, enter the name of the header that you want to search, e.g., User-Agent or Referer.
	// If type is any other value, omit this field.
	data?: null | string @go(Data,*string)

	// The part of the web request that you want AWS WAF to search for a specified string.
	// e.g., HEADER, METHOD or BODY.
	// See docs
	// for all supported values.
	type?: null | string @go(Type,*string)
}

#SizeConstraintsFieldToMatchParameters: {
	// When type is HEADER, enter the name of the header that you want to search, e.g., User-Agent or Referer.
	// If type is any other value, omit this field.
	// +kubebuilder:validation:Optional
	data?: null | string @go(Data,*string)

	// The part of the web request that you want AWS WAF to search for a specified string.
	// e.g., HEADER, METHOD or BODY.
	// See docs
	// for all supported values.
	// +kubebuilder:validation:Optional
	type?: null | string @go(Type,*string)
}

#SizeConstraintsInitParameters: {
	// The type of comparison you want to perform.
	// e.g., EQ, NE, LT, GT.
	// See docs for all supported values.
	comparisonOperator?: null | string @go(ComparisonOperator,*string)

	// Specifies where in a web request to look for the size constraint.
	fieldToMatch?: [...#SizeConstraintsFieldToMatchInitParameters] @go(FieldToMatch,[]SizeConstraintsFieldToMatchInitParameters)

	// The size in bytes that you want to compare against the size of the specified field_to_match.
	// Valid values are between 0 - 21474836480 bytes (0 - 20 GB).
	size?: null | float64 @go(Size,*float64)

	// Text transformations used to eliminate unusual formatting that attackers use in web requests in an effort to bypass AWS WAF.
	// If you specify a transformation, AWS WAF performs the transformation on field_to_match before inspecting a request for a match.
	// e.g., CMD_LINE, HTML_ENTITY_DECODE or NONE.
	// See docs
	// for all supported values.
	// Note: if you choose BODY as type, you must choose NONE because CloudFront forwards only the first 8192 bytes for inspection.
	textTransformation?: null | string @go(TextTransformation,*string)
}

#SizeConstraintsObservation: {
	// The type of comparison you want to perform.
	// e.g., EQ, NE, LT, GT.
	// See docs for all supported values.
	comparisonOperator?: null | string @go(ComparisonOperator,*string)

	// Specifies where in a web request to look for the size constraint.
	fieldToMatch?: [...#SizeConstraintsFieldToMatchObservation] @go(FieldToMatch,[]SizeConstraintsFieldToMatchObservation)

	// The size in bytes that you want to compare against the size of the specified field_to_match.
	// Valid values are between 0 - 21474836480 bytes (0 - 20 GB).
	size?: null | float64 @go(Size,*float64)

	// Text transformations used to eliminate unusual formatting that attackers use in web requests in an effort to bypass AWS WAF.
	// If you specify a transformation, AWS WAF performs the transformation on field_to_match before inspecting a request for a match.
	// e.g., CMD_LINE, HTML_ENTITY_DECODE or NONE.
	// See docs
	// for all supported values.
	// Note: if you choose BODY as type, you must choose NONE because CloudFront forwards only the first 8192 bytes for inspection.
	textTransformation?: null | string @go(TextTransformation,*string)
}

#SizeConstraintsParameters: {
	// The type of comparison you want to perform.
	// e.g., EQ, NE, LT, GT.
	// See docs for all supported values.
	// +kubebuilder:validation:Optional
	comparisonOperator?: null | string @go(ComparisonOperator,*string)

	// Specifies where in a web request to look for the size constraint.
	// +kubebuilder:validation:Optional
	fieldToMatch: [...#SizeConstraintsFieldToMatchParameters] @go(FieldToMatch,[]SizeConstraintsFieldToMatchParameters)

	// The size in bytes that you want to compare against the size of the specified field_to_match.
	// Valid values are between 0 - 21474836480 bytes (0 - 20 GB).
	// +kubebuilder:validation:Optional
	size?: null | float64 @go(Size,*float64)

	// Text transformations used to eliminate unusual formatting that attackers use in web requests in an effort to bypass AWS WAF.
	// If you specify a transformation, AWS WAF performs the transformation on field_to_match before inspecting a request for a match.
	// e.g., CMD_LINE, HTML_ENTITY_DECODE or NONE.
	// See docs
	// for all supported values.
	// Note: if you choose BODY as type, you must choose NONE because CloudFront forwards only the first 8192 bytes for inspection.
	// +kubebuilder:validation:Optional
	textTransformation?: null | string @go(TextTransformation,*string)
}

// SizeConstraintSetSpec defines the desired state of SizeConstraintSet
#SizeConstraintSetSpec: {
	v1.#ResourceSpec
	forProvider: #SizeConstraintSetParameters @go(ForProvider)

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
	initProvider?: #SizeConstraintSetInitParameters @go(InitProvider)
}

// SizeConstraintSetStatus defines the observed state of SizeConstraintSet.
#SizeConstraintSetStatus: {
	v1.#ResourceStatus
	atProvider?: #SizeConstraintSetObservation @go(AtProvider)
}

// SizeConstraintSet is the Schema for the SizeConstraintSets API. Provides a AWS WAF Size Constraint Set resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#SizeConstraintSet: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #SizeConstraintSetSpec   @go(Spec)
	status?: #SizeConstraintSetStatus @go(Status)
}

// SizeConstraintSetList contains a list of SizeConstraintSets
#SizeConstraintSetList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#SizeConstraintSet] @go(Items,[]SizeConstraintSet)
}
