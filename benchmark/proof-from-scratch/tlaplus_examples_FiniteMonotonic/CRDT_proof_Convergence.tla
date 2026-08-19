---- MODULE CRDT_proof_Convergence ----
EXTENDS CRDT_proof_ConvergenceDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM FairSpec => Convergence
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
