---- MODULE EWD687a_proof_Thm_CountersConsistent ----
EXTENDS EWD687a_proof_Thm_CountersConsistentDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Thm_CountersConsistent == Spec => CountersConsistent
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
