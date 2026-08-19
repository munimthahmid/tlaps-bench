---- MODULE ivy_examples_alternating_bit_protocol_Liveness ----
EXTENDS ivy_examples_alternating_bit_protocol_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == Spec => DataDelivery
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
