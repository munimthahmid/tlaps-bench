---- MODULE ivy_examples_split_queue_2_new_Liveness ----
EXTENDS ivy_examples_split_queue_2_new_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == Spec => WorkCompletion
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
