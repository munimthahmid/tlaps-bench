---- MODULE Consensus_LivenessTheorem ----
EXTENDS Consensus_LivenessTheoremDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM LivenessTheorem == LiveSpec =>  Success
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
