---- MODULE LamportMutex_proofs_BoundedNetworkInv ----
EXTENDS LamportMutex_proofs_BoundedNetworkInvDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM BoundedNetworkInv == Spec => []BoundedNetwork
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
