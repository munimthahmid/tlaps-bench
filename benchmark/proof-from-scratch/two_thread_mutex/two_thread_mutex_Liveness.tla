---- MODULE two_thread_mutex_Liveness ----
EXTENDS two_thread_mutex_LivenessDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Liveness == Spec => Termination
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
