---- MODULE Peterson_Liveness ----
EXTENDS Peterson_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM FairSpec => Liveness
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
