---- MODULE ZkV3_7_0_GlobalPrimaryOrder ----
EXTENDS ZkV3_7_0_GlobalPrimaryOrderDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []GlobalPrimaryOrder
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
