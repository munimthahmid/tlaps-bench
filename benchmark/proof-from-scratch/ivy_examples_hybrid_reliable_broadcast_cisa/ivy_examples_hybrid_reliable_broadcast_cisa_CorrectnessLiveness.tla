---- MODULE ivy_examples_hybrid_reliable_broadcast_cisa_CorrectnessLiveness ----
EXTENDS ivy_examples_hybrid_reliable_broadcast_cisa_CorrectnessLivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM CorrectnessLiveness == Spec => Correctness
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
