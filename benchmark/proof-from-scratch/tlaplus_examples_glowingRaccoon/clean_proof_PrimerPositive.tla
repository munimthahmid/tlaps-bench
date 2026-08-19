---- MODULE clean_proof_PrimerPositive ----
EXTENDS clean_proof_PrimerPositiveDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM PrimerPositive == Spec => []primerPositive
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
