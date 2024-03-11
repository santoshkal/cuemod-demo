// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/crossplane/crossplane/apis/apiextensions/v1

package v1

import xpv1 "github.com/crossplane/crossplane-runtime/apis/common/v1"

// A TypeEstablished XRD has created the CRD for its composite resource and
// started a controller to reconcile instances of said resource.
#TypeEstablished: xpv1.#ConditionType & "Established"

// A TypeOffered XRD has created the CRD for its composite resource claim
// and started a controller to reconcile instances of said claim.
#TypeOffered: xpv1.#ConditionType & "Offered"

#ReasonWatchingComposite:    xpv1.#ConditionReason & "WatchingCompositeResource"
#ReasonWatchingClaim:        xpv1.#ConditionReason & "WatchingCompositeResourceClaim"
#ReasonTerminatingComposite: xpv1.#ConditionReason & "TerminatingCompositeResource"
#ReasonTerminatingClaim:     xpv1.#ConditionReason & "TerminatingCompositeResourceClaim"
