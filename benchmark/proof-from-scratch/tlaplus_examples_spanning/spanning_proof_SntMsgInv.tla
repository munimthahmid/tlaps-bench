---- MODULE spanning_proof_SntMsgInv ----
EXTENDS spanning_proof_SntMsgInvDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM SntMsgInv == Spec => []SntMsg
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
