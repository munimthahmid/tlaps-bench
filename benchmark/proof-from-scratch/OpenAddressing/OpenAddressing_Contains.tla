---- MODULE OpenAddressing_Contains ----
EXTENDS OpenAddressing_ContainsDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Contains
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
