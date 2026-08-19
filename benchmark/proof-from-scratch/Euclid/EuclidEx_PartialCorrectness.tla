---- MODULE EuclidEx_PartialCorrectness ----
EXTENDS EuclidEx_PartialCorrectnessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []PartialCorrectness
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
