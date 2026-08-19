---- MODULE Allocator_NextMutex ----
EXTENDS Allocator_NextMutexDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM NextMutex == TypeInvariant /\ Mutex /\ Next => Mutex'
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
