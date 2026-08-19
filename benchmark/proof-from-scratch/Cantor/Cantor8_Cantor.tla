---- MODULE Cantor8_Cantor ----
EXTENDS Cantor8_CantorDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Cantor ==
  \A S : ~ \E f \in [S -> SUBSET S] : Surj (f, SUBSET S)
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
