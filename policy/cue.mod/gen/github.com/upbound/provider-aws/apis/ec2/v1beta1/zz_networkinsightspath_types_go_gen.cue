// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#NetworkInsightsPathInitParameters: {
	// IP address of the destination resource.
	destinationIp?: null | string @go(DestinationIP,*string)

	// Destination port to analyze access to.
	destinationPort?: null | float64 @go(DestinationPort,*float64)

	// Protocol to use for analysis. Valid options are tcp or udp.
	protocol?: null | string @go(Protocol,*string)

	// IP address of the source resource.
	sourceIp?: null | string @go(SourceIP,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#NetworkInsightsPathObservation: {
	// ARN of the Network Insights Path.
	arn?: null | string @go(Arn,*string)

	// ID of the resource which is the source of the path. Can be an Instance, Internet Gateway, Network Interface, Transit Gateway, VPC Endpoint, VPC Peering Connection or VPN Gateway.
	destination?: null | string @go(Destination,*string)

	// IP address of the destination resource.
	destinationIp?: null | string @go(DestinationIP,*string)

	// Destination port to analyze access to.
	destinationPort?: null | float64 @go(DestinationPort,*float64)

	// ID of the Network Insights Path.
	id?: null | string @go(ID,*string)

	// Protocol to use for analysis. Valid options are tcp or udp.
	protocol?: null | string @go(Protocol,*string)

	// ID of the resource which is the source of the path. Can be an Instance, Internet Gateway, Network Interface, Transit Gateway, VPC Endpoint, VPC Peering Connection or VPN Gateway.
	source?: null | string @go(Source,*string)

	// IP address of the source resource.
	sourceIp?: null | string @go(SourceIP,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)
}

#NetworkInsightsPathParameters: {
	// ID of the resource which is the source of the path. Can be an Instance, Internet Gateway, Network Interface, Transit Gateway, VPC Endpoint, VPC Peering Connection or VPN Gateway.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.NetworkInterface
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	destination?: null | string @go(Destination,*string)

	// IP address of the destination resource.
	// +kubebuilder:validation:Optional
	destinationIp?: null | string @go(DestinationIP,*string)

	// Destination port to analyze access to.
	// +kubebuilder:validation:Optional
	destinationPort?: null | float64 @go(DestinationPort,*float64)

	// Reference to a NetworkInterface in ec2 to populate destination.
	// +kubebuilder:validation:Optional
	destinationRef?: null | v1.#Reference @go(DestinationRef,*v1.Reference)

	// Selector for a NetworkInterface in ec2 to populate destination.
	// +kubebuilder:validation:Optional
	destinationSelector?: null | v1.#Selector @go(DestinationSelector,*v1.Selector)

	// Protocol to use for analysis. Valid options are tcp or udp.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// ID of the resource which is the source of the path. Can be an Instance, Internet Gateway, Network Interface, Transit Gateway, VPC Endpoint, VPC Peering Connection or VPN Gateway.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.NetworkInterface
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	source?: null | string @go(Source,*string)

	// IP address of the source resource.
	// +kubebuilder:validation:Optional
	sourceIp?: null | string @go(SourceIP,*string)

	// Reference to a NetworkInterface in ec2 to populate source.
	// +kubebuilder:validation:Optional
	sourceRef?: null | v1.#Reference @go(SourceRef,*v1.Reference)

	// Selector for a NetworkInterface in ec2 to populate source.
	// +kubebuilder:validation:Optional
	sourceSelector?: null | v1.#Selector @go(SourceSelector,*v1.Selector)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

// NetworkInsightsPathSpec defines the desired state of NetworkInsightsPath
#NetworkInsightsPathSpec: {
	v1.#ResourceSpec
	forProvider: #NetworkInsightsPathParameters @go(ForProvider)

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
	initProvider?: #NetworkInsightsPathInitParameters @go(InitProvider)
}

// NetworkInsightsPathStatus defines the observed state of NetworkInsightsPath.
#NetworkInsightsPathStatus: {
	v1.#ResourceStatus
	atProvider?: #NetworkInsightsPathObservation @go(AtProvider)
}

// NetworkInsightsPath is the Schema for the NetworkInsightsPaths API. Provides a Network Insights Path resource.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#NetworkInsightsPath: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.protocol) || (has(self.initProvider) && has(self.initProvider.protocol))",message="spec.forProvider.protocol is a required parameter"
	spec:    #NetworkInsightsPathSpec   @go(Spec)
	status?: #NetworkInsightsPathStatus @go(Status)
}

// NetworkInsightsPathList contains a list of NetworkInsightsPaths
#NetworkInsightsPathList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#NetworkInsightsPath] @go(Items,[]NetworkInsightsPath)
}
