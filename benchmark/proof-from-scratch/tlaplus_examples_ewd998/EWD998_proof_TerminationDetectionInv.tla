---- MODULE EWD998_proof_TerminationDetectionInv ----
EXTENDS EWD998_proof_TerminationDetectionInvDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM TerminationDetectionInv == Spec => []TerminationDetection
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
