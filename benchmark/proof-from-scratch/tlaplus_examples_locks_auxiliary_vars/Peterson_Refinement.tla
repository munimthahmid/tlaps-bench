---- MODULE Peterson_Refinement ----
EXTENDS Peterson_RefinementDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Refinement == Spec => L!Spec
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
