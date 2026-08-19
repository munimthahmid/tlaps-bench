---- MODULE ivy_examples_tlb_Liveness ----
EXTENDS ivy_examples_tlb_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == Spec => NonStarvation
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
