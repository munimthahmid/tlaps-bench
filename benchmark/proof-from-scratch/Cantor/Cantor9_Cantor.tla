---- MODULE Cantor9_Cantor ----
EXTENDS Cantor9_CantorDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Cantor ==
  ~ \E f : Surj (f, SUBSET (DOMAIN f))
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
