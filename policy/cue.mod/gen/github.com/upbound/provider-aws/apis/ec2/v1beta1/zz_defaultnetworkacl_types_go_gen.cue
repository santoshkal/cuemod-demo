// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#DefaultNetworkACLInitParameters: {
	// Configuration block for an egress rule. Detailed below.
	egress?: [...#EgressInitParameters] @go(Egress,[]EgressInitParameters)

	// Configuration block for an ingress rule. Detailed below.
	ingress?: [...#IngressInitParameters] @go(Ingress,[]IngressInitParameters)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#DefaultNetworkACLObservation: {
	// ARN of the Default Network ACL
	arn?: null | string @go(Arn,*string)

	// Network ACL ID to manage. This attribute is exported from aws_vpc, or manually found via the AWS Console.
	defaultNetworkAclId?: null | string @go(DefaultNetworkACLID,*string)

	// Configuration block for an egress rule. Detailed below.
	egress?: [...#EgressObservation] @go(Egress,[]EgressObservation)

	// ID of the Default Network ACL
	id?: null | string @go(ID,*string)

	// Configuration block for an ingress rule. Detailed below.
	ingress?: [...#IngressObservation] @go(Ingress,[]IngressObservation)

	// ID of the AWS account that owns the Default Network ACL
	ownerId?: null | string @go(OwnerID,*string)

	// List of Subnet IDs to apply the ACL to. See the notes above on Managing Subnets in the Default Network ACL
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// ID of the associated VPC
	vpcId?: null | string @go(VPCID,*string)
}

#DefaultNetworkACLParameters: {
	// Network ACL ID to manage. This attribute is exported from aws_vpc, or manually found via the AWS Console.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.VPC
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("default_network_acl_id",true)
	// +kubebuilder:validation:Optional
	defaultNetworkAclId?: null | string @go(DefaultNetworkACLID,*string)

	// Reference to a VPC in ec2 to populate defaultNetworkAclId.
	// +kubebuilder:validation:Optional
	defaultNetworkAclIdRef?: null | v1.#Reference @go(DefaultNetworkACLIDRef,*v1.Reference)

	// Selector for a VPC in ec2 to populate defaultNetworkAclId.
	// +kubebuilder:validation:Optional
	defaultNetworkAclIdSelector?: null | v1.#Selector @go(DefaultNetworkACLIDSelector,*v1.Selector)

	// Configuration block for an egress rule. Detailed below.
	// +kubebuilder:validation:Optional
	egress?: [...#EgressParameters] @go(Egress,[]EgressParameters)

	// Configuration block for an ingress rule. Detailed below.
	// +kubebuilder:validation:Optional
	ingress?: [...#IngressParameters] @go(Ingress,[]IngressParameters)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// References to Subnet in ec2 to populate subnetIds.
	// +kubebuilder:validation:Optional
	subnetIdRefs?: [...v1.#Reference] @go(SubnetIDRefs,[]v1.Reference)

	// Selector for a list of Subnet in ec2 to populate subnetIds.
	// +kubebuilder:validation:Optional
	subnetIdSelector?: null | v1.#Selector @go(SubnetIDSelector,*v1.Selector)

	// List of Subnet IDs to apply the ACL to. See the notes above on Managing Subnets in the Default Network ACL
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.Subnet
	// +crossplane:generate:reference:refFieldName=SubnetIDRefs
	// +crossplane:generate:reference:selectorFieldName=SubnetIDSelector
	// +kubebuilder:validation:Optional
	subnetIds?: [...null | string] @go(SubnetIds,[]*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#EgressInitParameters: {
	// The action to take.
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The from port to match.
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	toPort?: null | float64 @go(ToPort,*float64)
}

#EgressObservation: {
	// The action to take.
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The from port to match.
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	toPort?: null | float64 @go(ToPort,*float64)
}

#EgressParameters: {
	// The action to take.
	// +kubebuilder:validation:Optional
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	// +kubebuilder:validation:Optional
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The from port to match.
	// +kubebuilder:validation:Optional
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	// +kubebuilder:validation:Optional
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	// +kubebuilder:validation:Optional
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	// +kubebuilder:validation:Optional
	toPort?: null | float64 @go(ToPort,*float64)
}

#IngressInitParameters: {
	// The action to take.
	action?: null | string @go(Action,*string)

	// The from port to match.
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	toPort?: null | float64 @go(ToPort,*float64)
}

#IngressObservation: {
	// The action to take.
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	cidrBlock?: null | string @go(CidrBlock,*string)

	// The from port to match.
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	toPort?: null | float64 @go(ToPort,*float64)
}

#IngressParameters: {
	// The action to take.
	// +kubebuilder:validation:Optional
	action?: null | string @go(Action,*string)

	// The CIDR block to match. This must be a valid network mask.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/ec2/v1beta1.DefaultVPC
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractParamPath("cidr_block",true)
	// +kubebuilder:validation:Optional
	cidrBlock?: null | string @go(CidrBlock,*string)

	// Reference to a DefaultVPC in ec2 to populate cidrBlock.
	// +kubebuilder:validation:Optional
	cidrBlockRef?: null | v1.#Reference @go(CidrBlockRef,*v1.Reference)

	// Selector for a DefaultVPC in ec2 to populate cidrBlock.
	// +kubebuilder:validation:Optional
	cidrBlockSelector?: null | v1.#Selector @go(CidrBlockSelector,*v1.Selector)

	// The from port to match.
	// +kubebuilder:validation:Optional
	fromPort?: null | float64 @go(FromPort,*float64)

	// The IPv6 CIDR block.
	// +kubebuilder:validation:Optional
	ipv6CidrBlock?: null | string @go(IPv6CidrBlock,*string)

	// The ICMP type code to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpCode?: null | float64 @go(IcmpCode,*float64)

	// The ICMP type to be used. Default 0.
	// +kubebuilder:validation:Optional
	icmpType?: null | float64 @go(IcmpType,*float64)

	// The protocol to match. If using the -1 'all' protocol, you must specify a from and to port of 0.
	// +kubebuilder:validation:Optional
	protocol?: null | string @go(Protocol,*string)

	// The rule number. Used for ordering.
	// +kubebuilder:validation:Optional
	ruleNo?: null | float64 @go(RuleNo,*float64)

	// The to port to match.
	// +kubebuilder:validation:Optional
	toPort?: null | float64 @go(ToPort,*float64)
}

// DefaultNetworkACLSpec defines the desired state of DefaultNetworkACL
#DefaultNetworkACLSpec: {
	v1.#ResourceSpec
	forProvider: #DefaultNetworkACLParameters @go(ForProvider)

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
	initProvider?: #DefaultNetworkACLInitParameters @go(InitProvider)
}

// DefaultNetworkACLStatus defines the observed state of DefaultNetworkACL.
#DefaultNetworkACLStatus: {
	v1.#ResourceStatus
	atProvider?: #DefaultNetworkACLObservation @go(AtProvider)
}

// DefaultNetworkACL is the Schema for the DefaultNetworkACLs API. Manage a default network ACL.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#DefaultNetworkACL: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta       @go(ObjectMeta)
	spec:      #DefaultNetworkACLSpec   @go(Spec)
	status?:   #DefaultNetworkACLStatus @go(Status)
}

// DefaultNetworkACLList contains a list of DefaultNetworkACLs
#DefaultNetworkACLList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#DefaultNetworkACL] @go(Items,[]DefaultNetworkACL)
}
