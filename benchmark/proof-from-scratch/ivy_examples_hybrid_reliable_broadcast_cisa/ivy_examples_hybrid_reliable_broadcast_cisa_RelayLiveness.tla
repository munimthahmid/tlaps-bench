---- MODULE ivy_examples_hybrid_reliable_broadcast_cisa_RelayLiveness ----
EXTENDS ivy_examples_hybrid_reliable_broadcast_cisa_RelayLivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM RelayLiveness == Spec => Relay
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
