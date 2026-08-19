---- MODULE GermanData_Refinement ----
EXTENDS GermanData_RefinementDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => Refinement
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
