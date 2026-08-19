---- MODULE SyncTerminationDetection_proof_Quiescent ----
EXTENDS SyncTerminationDetection_proof_QuiescentDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Quiescent == Spec => Quiescence
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
