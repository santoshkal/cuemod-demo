// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/s3/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#BucketAnalyticsConfigurationFilterInitParameters: {
	// Object prefix for filtering.
	prefix?: null | string @go(Prefix,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#BucketAnalyticsConfigurationFilterObservation: {
	// Object prefix for filtering.
	prefix?: null | string @go(Prefix,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#BucketAnalyticsConfigurationFilterParameters: {
	// Object prefix for filtering.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#BucketAnalyticsConfigurationInitParameters: {
	// Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags (documented below).
	filter?: [...#BucketAnalyticsConfigurationFilterInitParameters] @go(Filter,[]BucketAnalyticsConfigurationFilterInitParameters)

	// Unique identifier of the analytics configuration for the bucket.
	name?: null | string @go(Name,*string)

	// Configuration for the analytics data export (documented below).
	storageClassAnalysis?: [...#StorageClassAnalysisInitParameters] @go(StorageClassAnalysis,[]StorageClassAnalysisInitParameters)
}

#BucketAnalyticsConfigurationObservation: {
	// Name of the bucket this analytics configuration is associated with.
	bucket?: null | string @go(Bucket,*string)

	// Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags (documented below).
	filter?: [...#BucketAnalyticsConfigurationFilterObservation] @go(Filter,[]BucketAnalyticsConfigurationFilterObservation)
	id?: null | string @go(ID,*string)

	// Unique identifier of the analytics configuration for the bucket.
	name?: null | string @go(Name,*string)

	// Configuration for the analytics data export (documented below).
	storageClassAnalysis?: [...#StorageClassAnalysisObservation] @go(StorageClassAnalysis,[]StorageClassAnalysisObservation)
}

#BucketAnalyticsConfigurationParameters: {
	// Name of the bucket this analytics configuration is associated with.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	bucket?: null | string @go(Bucket,*string)

	// Reference to a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketRef?: null | v1.#Reference @go(BucketRef,*v1.Reference)

	// Selector for a Bucket in s3 to populate bucket.
	// +kubebuilder:validation:Optional
	bucketSelector?: null | v1.#Selector @go(BucketSelector,*v1.Selector)

	// Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags (documented below).
	// +kubebuilder:validation:Optional
	filter?: [...#BucketAnalyticsConfigurationFilterParameters] @go(Filter,[]BucketAnalyticsConfigurationFilterParameters)

	// Unique identifier of the analytics configuration for the bucket.
	// +kubebuilder:validation:Optional
	name?: null | string @go(Name,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Configuration for the analytics data export (documented below).
	// +kubebuilder:validation:Optional
	storageClassAnalysis?: [...#StorageClassAnalysisParameters] @go(StorageClassAnalysis,[]StorageClassAnalysisParameters)
}

#DataExportDestinationInitParameters: {
	// Analytics data export currently only supports an S3 bucket destination (documented below).
	s3BucketDestination?: [...#S3BucketDestinationInitParameters] @go(S3BucketDestination,[]S3BucketDestinationInitParameters)
}

#DataExportDestinationObservation: {
	// Analytics data export currently only supports an S3 bucket destination (documented below).
	s3BucketDestination?: [...#S3BucketDestinationObservation] @go(S3BucketDestination,[]S3BucketDestinationObservation)
}

#DataExportDestinationParameters: {
	// Analytics data export currently only supports an S3 bucket destination (documented below).
	// +kubebuilder:validation:Optional
	s3BucketDestination: [...#S3BucketDestinationParameters] @go(S3BucketDestination,[]S3BucketDestinationParameters)
}

#DataExportInitParameters: {
	// Specifies the destination for the exported analytics data (documented below).
	destination?: [...#DataExportDestinationInitParameters] @go(Destination,[]DataExportDestinationInitParameters)

	// Schema version of exported analytics data. Allowed values: V_1. Default value: V_1.
	outputSchemaVersion?: null | string @go(OutputSchemaVersion,*string)
}

#DataExportObservation: {
	// Specifies the destination for the exported analytics data (documented below).
	destination?: [...#DataExportDestinationObservation] @go(Destination,[]DataExportDestinationObservation)

	// Schema version of exported analytics data. Allowed values: V_1. Default value: V_1.
	outputSchemaVersion?: null | string @go(OutputSchemaVersion,*string)
}

#DataExportParameters: {
	// Specifies the destination for the exported analytics data (documented below).
	// +kubebuilder:validation:Optional
	destination: [...#DataExportDestinationParameters] @go(Destination,[]DataExportDestinationParameters)

	// Schema version of exported analytics data. Allowed values: V_1. Default value: V_1.
	// +kubebuilder:validation:Optional
	outputSchemaVersion?: null | string @go(OutputSchemaVersion,*string)
}

#S3BucketDestinationInitParameters: {
	// Account ID that owns the destination bucket.
	bucketAccountId?: null | string @go(BucketAccountID,*string)

	// Output format of exported analytics data. Allowed values: CSV. Default value: CSV.
	format?: null | string @go(Format,*string)

	// Object prefix for filtering.
	prefix?: null | string @go(Prefix,*string)
}

#S3BucketDestinationObservation: {
	// Account ID that owns the destination bucket.
	bucketAccountId?: null | string @go(BucketAccountID,*string)

	// ARN of the destination bucket.
	bucketArn?: null | string @go(BucketArn,*string)

	// Output format of exported analytics data. Allowed values: CSV. Default value: CSV.
	format?: null | string @go(Format,*string)

	// Object prefix for filtering.
	prefix?: null | string @go(Prefix,*string)
}

#S3BucketDestinationParameters: {
	// Account ID that owns the destination bucket.
	// +kubebuilder:validation:Optional
	bucketAccountId?: null | string @go(BucketAccountID,*string)

	// ARN of the destination bucket.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/s3/v1beta1.Bucket
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("arn",true)
	// +kubebuilder:validation:Optional
	bucketArn?: null | string @go(BucketArn,*string)

	// Reference to a Bucket in s3 to populate bucketArn.
	// +kubebuilder:validation:Optional
	bucketArnRef?: null | v1.#Reference @go(BucketArnRef,*v1.Reference)

	// Selector for a Bucket in s3 to populate bucketArn.
	// +kubebuilder:validation:Optional
	bucketArnSelector?: null | v1.#Selector @go(BucketArnSelector,*v1.Selector)

	// Output format of exported analytics data. Allowed values: CSV. Default value: CSV.
	// +kubebuilder:validation:Optional
	format?: null | string @go(Format,*string)

	// Object prefix for filtering.
	// +kubebuilder:validation:Optional
	prefix?: null | string @go(Prefix,*string)
}

#StorageClassAnalysisInitParameters: {
	// Data export configuration (documented below).
	dataExport?: [...#DataExportInitParameters] @go(DataExport,[]DataExportInitParameters)
}

#StorageClassAnalysisObservation: {
	// Data export configuration (documented below).
	dataExport?: [...#DataExportObservation] @go(DataExport,[]DataExportObservation)
}

#StorageClassAnalysisParameters: {
	// Data export configuration (documented below).
	// +kubebuilder:validation:Optional
	dataExport: [...#DataExportParameters] @go(DataExport,[]DataExportParameters)
}

// BucketAnalyticsConfigurationSpec defines the desired state of BucketAnalyticsConfiguration
#BucketAnalyticsConfigurationSpec: {
	v1.#ResourceSpec
	forProvider: #BucketAnalyticsConfigurationParameters @go(ForProvider)

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
	initProvider?: #BucketAnalyticsConfigurationInitParameters @go(InitProvider)
}

// BucketAnalyticsConfigurationStatus defines the observed state of BucketAnalyticsConfiguration.
#BucketAnalyticsConfigurationStatus: {
	v1.#ResourceStatus
	atProvider?: #BucketAnalyticsConfigurationObservation @go(AtProvider)
}

// BucketAnalyticsConfiguration is the Schema for the BucketAnalyticsConfigurations API. Provides a S3 bucket analytics configuration resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#BucketAnalyticsConfiguration: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.name) || (has(self.initProvider) && has(self.initProvider.name))",message="spec.forProvider.name is a required parameter"
	spec:    #BucketAnalyticsConfigurationSpec   @go(Spec)
	status?: #BucketAnalyticsConfigurationStatus @go(Status)
}

// BucketAnalyticsConfigurationList contains a list of BucketAnalyticsConfigurations
#BucketAnalyticsConfigurationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#BucketAnalyticsConfiguration] @go(Items,[]BucketAnalyticsConfiguration)
}
