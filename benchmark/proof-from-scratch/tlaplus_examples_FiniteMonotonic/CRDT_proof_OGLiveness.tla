---- MODULE CRDT_proof_OGLiveness ----
EXTENDS CRDT_proof_OGLivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM OGLiveness == OGSpec => <>(\A n, o \in Node : counter[n] = counter[o])
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
