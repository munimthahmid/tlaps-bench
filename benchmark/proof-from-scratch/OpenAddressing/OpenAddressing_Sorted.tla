---- MODULE OpenAddressing_Sorted ----
EXTENDS OpenAddressing_SortedDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Sorted
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
