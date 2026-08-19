---- MODULE GermanData_ExclusiveIsolation ----
EXTENDS GermanData_ExclusiveIsolationDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []ExclusiveIsolation
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
