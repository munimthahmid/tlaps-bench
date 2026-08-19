---- MODULE VoteProof_Liveness ----
EXTENDS VoteProof_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == LiveSpec => C!LiveSpec
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
