---- MODULE ZkV3_7_0_Leadership1 ----
EXTENDS ZkV3_7_0_Leadership1Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Leadership1
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
