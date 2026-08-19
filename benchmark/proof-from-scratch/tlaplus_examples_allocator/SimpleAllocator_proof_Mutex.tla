---- MODULE SimpleAllocator_proof_Mutex ----
EXTENDS SimpleAllocator_proof_MutexDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Mutex == SimpleAllocator => []ResourceMutex
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
