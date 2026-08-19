---- MODULE Consensus_LiveSpecEquals ----
EXTENDS Consensus_LiveSpecEqualsDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM LiveSpecEquals ==
          LiveSpec <=> Spec /\ ([]<><<Next>>_vars \/ []<>(chosen # {}))
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
