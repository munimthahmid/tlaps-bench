---- MODULE OpenAddressing_Duplicates ----
EXTENDS OpenAddressing_DuplicatesDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Duplicates
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
