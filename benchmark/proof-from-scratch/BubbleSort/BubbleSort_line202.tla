---- MODULE BubbleSort_line202 ----
EXTENDS BubbleSort_line202Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => [](pc = "Done" => IsSorted(A) /\ IsPermOf(A, A0))
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
