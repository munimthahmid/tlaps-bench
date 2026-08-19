---- MODULE GermanControlBenchmarks_Coherence ----
EXTENDS GermanControlBenchmarks_CoherenceDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Coherence
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
