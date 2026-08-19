---- MODULE Allocator_InitMutex ----
EXTENDS Allocator_InitMutexDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM InitMutex == Init => Mutex
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
