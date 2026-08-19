---- MODULE ReadersWriters_proof_SafetyCorrect ----
EXTENDS ReadersWriters_proof_SafetyCorrectDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM SafetyCorrect == Spec => []Safety
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
