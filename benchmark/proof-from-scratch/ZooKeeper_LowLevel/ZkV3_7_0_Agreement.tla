---- MODULE ZkV3_7_0_Agreement ----
EXTENDS ZkV3_7_0_AgreementDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Agreement
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
