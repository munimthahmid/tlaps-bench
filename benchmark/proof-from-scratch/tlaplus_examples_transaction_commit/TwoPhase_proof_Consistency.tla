---- MODULE TwoPhase_proof_Consistency ----
EXTENDS TwoPhase_proof_ConsistencyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Consistency == TPSpec => []TC!TCConsistent
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
