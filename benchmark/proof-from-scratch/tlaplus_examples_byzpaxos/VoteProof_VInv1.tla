---- MODULE VoteProof_VInv1 ----
EXTENDS VoteProof_VInv1Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM VInv3 => VInv1
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
