---- MODULE Zab_Leadership2 ----
EXTENDS Zab_Leadership2Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Leadership2
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
