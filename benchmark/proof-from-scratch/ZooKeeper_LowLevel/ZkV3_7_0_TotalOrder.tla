---- MODULE ZkV3_7_0_TotalOrder ----
EXTENDS ZkV3_7_0_TotalOrderDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []TotalOrder
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
