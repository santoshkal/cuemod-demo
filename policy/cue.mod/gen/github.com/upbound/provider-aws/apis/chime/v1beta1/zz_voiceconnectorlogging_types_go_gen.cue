// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/upbound/provider-aws/apis/chime/v1beta1

package v1beta1

import (
	"github.com/crossplane/crossplane-runtime/apis/common/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#VoiceConnectorLoggingInitParameters: {
	// When true, enables logging of detailed media metrics for Voice Connectors to Amazon CloudWatch logs.
	enableMediaMetricLogs?: null | bool @go(EnableMediaMetricLogs,*bool)

	// When true, enables SIP message logs for sending to Amazon CloudWatch Logs.
	enableSipLogs?: null | bool @go(EnableSIPLogs,*bool)
}

#VoiceConnectorLoggingObservation: {
	// When true, enables logging of detailed media metrics for Voice Connectors to Amazon CloudWatch logs.
	enableMediaMetricLogs?: null | bool @go(EnableMediaMetricLogs,*bool)

	// When true, enables SIP message logs for sending to Amazon CloudWatch Logs.
	enableSipLogs?: null | bool @go(EnableSIPLogs,*bool)

	// The Amazon Chime Voice Connector ID.
	id?: null | string @go(ID,*string)

	// The Amazon Chime Voice Connector ID.
	voiceConnectorId?: null | string @go(VoiceConnectorID,*string)
}

#VoiceConnectorLoggingParameters: {
	// When true, enables logging of detailed media metrics for Voice Connectors to Amazon CloudWatch logs.
	// +kubebuilder:validation:Optional
	enableMediaMetricLogs?: null | bool @go(EnableMediaMetricLogs,*bool)

	// When true, enables SIP message logs for sending to Amazon CloudWatch Logs.
	// +kubebuilder:validation:Optional
	enableSipLogs?: null | bool @go(EnableSIPLogs,*bool)

	// Region is the region you'd like your resource to be created in.
	// +upjet:crd:field:TFTag=-
	// +kubebuilder:validation:Required
	region?: null | string @go(Region,*string)

	// The Amazon Chime Voice Connector ID.
	// +crossplane:generate:reference:type=github.com/upbound/provider-aws/apis/chime/v1beta1.VoiceConnector
	// +crossplane:generate:reference:extractor=github.com/crossplane/upjet/pkg/resource.ExtractResourceID()
	// +kubebuilder:validation:Optional
	voiceConnectorId?: null | string @go(VoiceConnectorID,*string)

	// Reference to a VoiceConnector in chime to populate voiceConnectorId.
	// +kubebuilder:validation:Optional
	voiceConnectorIdRef?: null | v1.#Reference @go(VoiceConnectorIDRef,*v1.Reference)

	// Selector for a VoiceConnector in chime to populate voiceConnectorId.
	// +kubebuilder:validation:Optional
	voiceConnectorIdSelector?: null | v1.#Selector @go(VoiceConnectorIDSelector,*v1.Selector)
}

// VoiceConnectorLoggingSpec defines the desired state of VoiceConnectorLogging
#VoiceConnectorLoggingSpec: {
	v1.#ResourceSpec
	forProvider: #VoiceConnectorLoggingParameters @go(ForProvider)

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
	initProvider?: #VoiceConnectorLoggingInitParameters @go(InitProvider)
}

// VoiceConnectorLoggingStatus defines the observed state of VoiceConnectorLogging.
#VoiceConnectorLoggingStatus: {
	v1.#ResourceStatus
	atProvider?: #VoiceConnectorLoggingObservation @go(AtProvider)
}

// VoiceConnectorLogging is the Schema for the VoiceConnectorLoggings API. Adds a logging configuration for the specified Amazon Chime Voice Connector. The logging configuration specifies whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,aws}
#VoiceConnectorLogging: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta           @go(ObjectMeta)
	spec:      #VoiceConnectorLoggingSpec   @go(Spec)
	status?:   #VoiceConnectorLoggingStatus @go(Status)
}

// VoiceConnectorLoggingList contains a list of VoiceConnectorLoggings
#VoiceConnectorLoggingList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VoiceConnectorLogging] @go(Items,[]VoiceConnectorLogging)
}
