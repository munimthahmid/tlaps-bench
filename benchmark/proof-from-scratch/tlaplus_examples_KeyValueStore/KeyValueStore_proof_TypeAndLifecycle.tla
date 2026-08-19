---- MODULE KeyValueStore_proof_TypeAndLifecycle ----
EXTENDS KeyValueStore_proof_TypeAndLifecycleDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM TypeAndLifecycle == Spec => []Inv
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
