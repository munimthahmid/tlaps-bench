---- MODULE AsyncTerminationDetection_proof_Liveness ----
EXTENDS AsyncTerminationDetection_proof_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == Spec => Live
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
