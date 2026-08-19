---- MODULE tcp_proof_InvInit ----
EXTENDS tcp_proof_InvInitDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM InvInit == Init => Inv
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
