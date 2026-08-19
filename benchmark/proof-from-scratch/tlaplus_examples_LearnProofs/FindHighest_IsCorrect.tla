---- MODULE FindHighest_IsCorrect ----
EXTENDS FindHighest_IsCorrectDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM IsCorrect == Spec => []Correctness
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
