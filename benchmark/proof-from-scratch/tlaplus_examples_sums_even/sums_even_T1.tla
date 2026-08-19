---- MODULE sums_even_T1 ----
EXTENDS sums_even_T1Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM T1 == \A x \in Nat: Even(x+x)
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
