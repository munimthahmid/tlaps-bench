---- MODULE bcastByz_Unforg_Step4 ----
EXTENDS bcastByz_Unforg_Step4Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Unforg_Step4 == SpecNoBcast => []Unforg
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
