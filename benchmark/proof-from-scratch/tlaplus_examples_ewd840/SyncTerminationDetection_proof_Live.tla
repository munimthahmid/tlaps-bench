---- MODULE SyncTerminationDetection_proof_Live ----
EXTENDS SyncTerminationDetection_proof_LiveDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Live == Spec => Liveness
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
