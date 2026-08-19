---- MODULE Peterson_IndInvariant ----
EXTENDS Peterson_IndInvariantDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM IndInvariant == Spec => []Inv
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
