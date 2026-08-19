---- MODULE GermanData_WritebackCarriesLatest ----
EXTENDS GermanData_WritebackCarriesLatestDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []WritebackCarriesLatest
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
