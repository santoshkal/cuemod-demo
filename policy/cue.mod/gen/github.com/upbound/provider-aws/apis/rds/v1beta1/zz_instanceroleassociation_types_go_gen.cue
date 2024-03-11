// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/rds/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#InstanceRoleAssociationInitParameters: {
	// Name of the feature for association. This can be found in the AWS documentation relevant to the integration or a full list is available in the SupportedFeatureNames list returned by AWS CLI rds describe-db-engine-versions.
	featureName?: null | string @go(FeatureName,*string)
}

#InstanceRoleAssociationObservation: {
	// DB Instance Identifier to associate with the IAM Role.
	dbInstanceIdentifier?: null | string @go(DBInstanceIdentifier,*string)

	// Name of the feature for association. This can be found in the AWS documentation relevant to the integration or a full list is available in the SupportedFeatureNames list returned by AWS CLI rds describe-db-engine-versions.
	featureName?: null | string @go(FeatureName,*string)

	// DB Instance Identifier and IAM Role ARN separated by a comma (,)
	id?: null | string @go(ID,*string)

	// Amazon Resource Name (ARN) of the IAM Role to associate with the DB Instance.
	roleArn?: null | string @go(RoleArn,*string)
}

#InstanceRoleAssociationParameters: {
	// DB Instance Identifier to associate with the IAM Role.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/rds/v1beta1.Instance
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	dbInstanceIdentifier?: null | string @go(DBInstanceIdentifier,*string)

	// Reference to a Instance in rds to populate dbInstanceIdentifier.
	// +kubebuilder:validation:Optional
	dbInstanceIdentifierRef?: null | v1.#Reference @go(DBInstanceIdentifierRef,*v1.Reference)

	// Selector for a Instance in rds to populate dbInstanceIdentifier.
	// +kubebuilder:validation:Optional
	dbInstanceIdentifierSelector?: null | v1.#Selector @go(DBInstanceIdentifierSelector,*v1.Selector)

	// Name of the feature for association. This can be found in the AWS documentation relevant to the integration or a full list is available in the SupportedFeatureNames list returned by AWS CLI rds describe-db-engine-versions.
	// +kubebuilder:validation:Optional
	featureName?: null | string @go(FeatureName,*string)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// Amazon Resource Name (ARN) of the IAM Role to associate with the DB Instance.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/iam/v1beta1.Role
	// +crossplane:generate:reference:extractor=github.com/upbound/provider-aws/config/common.ARNExtractor()
	// +kubebuilder:validation:Optional
	roleArn?: null | string @go(RoleArn,*string)

	// Reference to a Role in iam to populate roleArn.
	// +kubebuilder:validation:Optional
	roleArnRef?: null | v1.#Reference @go(RoleArnRef,*v1.Reference)

	// Selector for a Role in iam to populate roleArn.
	// +kubebuilder:validation:Optional
	roleArnSelector?: null | v1.#Selector @go(RoleArnSelector,*v1.Selector)
}

// InstanceRoleAssociationSpec defines the desired state of InstanceRoleAssociation
#InstanceRoleAssociationSpec: {
	v1.#ResourceSpec
	forProvider: #InstanceRoleAssociationParameters @go(ForProvider)

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
	initProvider?: #InstanceRoleAssociationInitParameters @go(InitProvider)
}

// InstanceRoleAssociationStatus defines the observed state of InstanceRoleAssociation.
#InstanceRoleAssociationStatus: {
	v1.#ResourceStatus
	atProvider?: #InstanceRoleAssociationObservation @go(AtProvider)
}

// InstanceRoleAssociation is the Schema for the InstanceRoleAssociations API. Manages an RDS DB Instance association with an IAM Role.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#InstanceRoleAssociation: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:XValidation:rule="!('*' in self.managementPolicies || 'Create' in self.managementPolicies || 'Update' in self.managementPolicies) || has(self.forProvider.featureName) || (has(self.initProvider) && has(self.initProvider.featureName))",message="spec.forProvider.featureName is a required parameter"
	spec:    #InstanceRoleAssociationSpec   @go(Spec)
	status?: #InstanceRoleAssociationStatus @go(Status)
}

// InstanceRoleAssociationList contains a list of InstanceRoleAssociations
#InstanceRoleAssociationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#InstanceRoleAssociation] @go(Items,[]InstanceRoleAssociation)
}
