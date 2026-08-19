---- MODULE EWD840_proof_Safety ----
EXTENDS EWD840_proof_SafetyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Safety == Spec => []TerminationDetection
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
