// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/macie2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#CustomDataIdentifierInitParameters: {
	// A custom description of the custom data identifier. The description can contain as many as 512 characters.
	description?: null | string @go(Description,*string)

	// An array that lists specific character sequences (ignore words) to exclude from the results. If the text matched by the regular expression is the same as any string in this array, Amazon Macie ignores it. The array can contain as many as 10 ignore words. Each ignore word can contain 4 - 90 characters. Ignore words are case sensitive.
	ignoreWords?: [...null | string] @go(IgnoreWords,[]*string)

	// An array that lists specific character sequences (keywords), one of which must be within proximity (maximum_match_distance) of the regular expression to match. The array can contain as many as 50 keywords. Each keyword can contain 3 - 90 characters. Keywords aren't case sensitive.
	keywords?: [...null | string] @go(Keywords,[]*string)

	// The maximum number of characters that can exist between text that matches the regex pattern and the character sequences specified by the keywords array. Macie includes or excludes a result based on the proximity of a keyword to text that matches the regex pattern. The distance can be 1 - 300 characters. The default value is 50.
	maximumMatchDistance?: null | float64 @go(MaximumMatchDistance,*float64)

	// A custom name for the custom data identifier. The name can contain as many as 128 characters. Conflicts with name_prefix.
	name?: null | string @go(Name,*string)

	// The regular expression (regex) that defines the pattern to match. The expression can contain as many as 512 characters.
	regex?: null | string @go(Regex,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#CustomDataIdentifierObservation: {
	// The Amazon Resource Name (ARN) of the custom data identifier.
	arn?: null | string @go(Arn,*string)

	// The date and time, in UTC and extended RFC 3339 format, when the Amazon Macie account was created.
	createdAt?: null | string @go(CreatedAt,*string)

	// A custom description of the custom data identifier. The description can contain as many as 512 characters.
	description?: null | string @go(Description,*string)

	// The unique identifier (ID) of the macie custom data identifier.
	id?: null | string @go(ID,*string)

	// An array that lists specific character sequences (ignore words) to exclude from the results. If the text matched by the regular expression is the same as any string in this array, Amazon Macie ignores it. The array can contain as many as 10 ignore words. Each ignore word can contain 4 - 90 characters. Ignore words are case sensitive.
	ignoreWords?: [...null | string] @go(IgnoreWords,[]*string)

	// An array that lists specific character sequences (keywords), one of which must be within proximity (maximum_match_distance) of the regular expression to match. The array can contain as many as 50 keywords. Each keyword can contain 3 - 90 characters. Keywords aren't case sensitive.
	keywords?: [...null | string] @go(Keywords,[]*string)

	// The maximum number of characters that can exist between text that matches the regex pattern and the character sequences specified by the keywords array. Macie includes or excludes a result based on the proximity of a keyword to text that matches the regex pattern. The distance can be 1 - 300 characters. The default value is 50.
	maximumMatchDistance?: null | float64 @go(MaximumMatchDistance,*float64)

	// A custom name for the custom data identifier. The name can contain as many as 128 characters. Conflicts with name_prefix.
	name?: null | string @go(Name,*string)

	// The regular expression (regex) that defines the pattern to match. The expression can contain as many as 512 characters.
	regex?: null | string @go(Regex,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#CustomDataIdentifierParameters: {
	// A custom description of the custom data identifier. The description can contain as many as 512 characters.
	// +kubebuilder:validation:Optional
	description?: null | string @go(Description,*string)

	// An array that lists specific character sequences (ignore words) to exclude from the results. If the text matched by the regular expression is the same as any string in this array, Amazon Macie ignores it. The array can contain as many as 10 ignore words. Each ignore word can contain 4 - 90 characters. Ignore words are case sensitive.
	// +kubebuilder:validation:Optional
	ignoreWords?: [...null | string] @go(IgnoreWords,[]*string)

	// An array that lists specific character sequences (keywords), one of which must be within proximity (maximum_match_distance) of the regular expression to match. The array can contain as many as 50 keywords. Each keyword can contain 3 - 90 characters. Keywords aren't case sensitive.
	// +kubebuilder:validation:Optional
	keywords?: [...null | string] @go(Keywords,[]*string)

	// The maximum number of characters that can exist between text that matches the regex pattern and the character sequences specified by the keywords array. Macie includes or excludes a result based on the proximity of a keyword to text that matches the regex pattern. The distance can be 1 - 300 characters. The default value is 50.
	// +kubebuilder:validation:Optional
	maximumMatchDistance?: null | float64 @go(MaximumMatchDistance,*float64)

	// A custom name for the custom data identifier. The name can contain as many as 128 characters. Conflicts with name_prefix.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// The regular expression (regex) that defines the pattern to match. The expression can contain as many as 512 characters.
	// +kubebuilder:validation:Optional
	regex?: null | string @go(Regex,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// CustomDataIdentifierSpec defines the desired state of CustomDataIdentifier
#CustomDataIdentifierSpec: {
	v1.#ResourceSpec
	forProvider: #CustomDataIdentifierParameters @go(ForProvider)

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
	initProvider?: #CustomDataIdentifierInitParameters @go(InitProvider)
}

// CustomDataIdentifierStatus defines the observed state of CustomDataIdentifier.
#CustomDataIdentifierStatus: {
	v1.#ResourceStatus
	atProvider?: #CustomDataIdentifierObservation @go(AtProvider)
}

// CustomDataIdentifier is the Schema for the CustomDataIdentifiers API. Provides a resource to manage an AWS Macie Custom Data Identifier.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#CustomDataIdentifier: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta          @go(ObjectMeta)
	spec:      #CustomDataIdentifierSpec   @go(Spec)
	status?:   #CustomDataIdentifierStatus @go(Status)
}

// CustomDataIdentifierList contains a list of CustomDataIdentifiers
#CustomDataIdentifierList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#CustomDataIdentifier] @go(Items,[]CustomDataIdentifier)
}
