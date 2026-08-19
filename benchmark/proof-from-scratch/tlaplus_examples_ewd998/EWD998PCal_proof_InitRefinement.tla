---- MODULE EWD998PCal_proof_InitRefinement ----
EXTENDS EWD998PCal_proof_InitRefinementDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM InitRefinement == Init => EWD998!Init
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
