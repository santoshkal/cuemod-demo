// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/ec2/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#TransitGatewayRouteTableInitParameters_2: {
	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)
}

#TransitGatewayRouteTableObservation_2: {
	// EC2 Transit Gateway Route Table Amazon Resource Name (ARN).
	arn?: null | string @go(Arn,*string)

	// Boolean whether this is the default association route table for the EC2 Transit Gateway.
	defaultAssociationRouteTable?: null | bool @go(DefaultAssociationRouteTable,*bool)

	// Boolean whether this is the default propagation route table for the EC2 Transit Gateway.
	defaultPropagationRouteTable?: null | bool @go(DefaultPropagationRouteTable,*bool)

	// EC2 Transit Gateway Route Table identifier
	id?: null | string @go(ID,*string)

	// Key-value map of resource tags.
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
	tagsAll?: {[string]: null | string} @go(TagsAll,map[string]*string)

	// Identifier of EC2 Transit Gateway.
	transitGatewayId?: null | string @go(TransitGatewayID,*string)
}

#TransitGatewayRouteTableParameters_2: {
	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Key-value map of resource tags.
	// +kubebuilder:validation:Optional
	tags?: {[string]: null | string} @go(Tags,map[string]*string)

	// Identifier of EC2 Transit Gateway.
	// +crossplane:generate:reference:type=TransitGateway
	// +kubebuilder:validation:Optional
	transitGatewayId?: null | string @go(TransitGatewayID,*string)

	// Reference to a TransitGateway to populate transitGatewayId.
	// +kubebuilder:validation:Optional
	transitGatewayIdRef?: null | v1.#Reference @go(TransitGatewayIDRef,*v1.Reference)

	// Selector for a TransitGateway to populate transitGatewayId.
	// +kubebuilder:validation:Optional
	transitGatewayIdSelector?: null | v1.#Selector @go(TransitGatewayIDSelector,*v1.Selector)
}

// TransitGatewayRouteTableSpec defines the desired state of TransitGatewayRouteTable
#TransitGatewayRouteTableSpec: {
	v1.#ResourceSpec
	forProvider: #TransitGatewayRouteTableParameters_2 @go(ForProvider)

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
	initProvider?: #TransitGatewayRouteTableInitParameters_2 @go(InitProvider)
}

// TransitGatewayRouteTableStatus defines the observed state of TransitGatewayRouteTable.
#TransitGatewayRouteTableStatus: {
	v1.#ResourceStatus
	atProvider?: #TransitGatewayRouteTableObservation_2 @go(AtProvider)
}

// TransitGatewayRouteTable is the Schema for the TransitGatewayRouteTables API. Manages an EC2 Transit Gateway Route Table
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#TransitGatewayRouteTable: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta              @go(ObjectMeta)
	spec:      #TransitGatewayRouteTableSpec   @go(Spec)
	status?:   #TransitGatewayRouteTableStatus @go(Status)
}

// TransitGatewayRouteTableList contains a list of TransitGatewayRouteTables
#TransitGatewayRouteTableList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TransitGatewayRouteTable] @go(Items,[]TransitGatewayRouteTable)
}
