---- MODULE ivy_examples_hybrid_reliable_broadcast_cisa_Safety ----
EXTENDS ivy_examples_hybrid_reliable_broadcast_cisa_SafetyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Safety == SafetySpec => []Unforgeability
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
