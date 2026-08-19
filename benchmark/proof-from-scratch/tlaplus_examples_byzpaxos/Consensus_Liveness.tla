---- MODULE Consensus_Liveness ----
EXTENDS Consensus_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == LiveSpec => Success
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
