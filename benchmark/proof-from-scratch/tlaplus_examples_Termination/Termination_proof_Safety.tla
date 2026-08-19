---- MODULE Termination_proof_Safety ----
EXTENDS Termination_proof_SafetyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Safety
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
