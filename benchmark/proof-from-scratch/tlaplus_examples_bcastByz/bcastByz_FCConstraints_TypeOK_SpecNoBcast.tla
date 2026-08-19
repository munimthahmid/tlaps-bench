---- MODULE bcastByz_FCConstraints_TypeOK_SpecNoBcast ----
EXTENDS bcastByz_FCConstraints_TypeOK_SpecNoBcastDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM FCConstraints_TypeOK_SpecNoBcast == SpecNoBcast => [](FCConstraints /\ TypeOK)
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
