---- MODULE SumAndMax_Correctness ----
EXTENDS SumAndMax_CorrectnessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Correctness
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
