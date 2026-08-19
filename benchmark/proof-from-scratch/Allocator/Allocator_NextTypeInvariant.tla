---- MODULE Allocator_NextTypeInvariant ----
EXTENDS Allocator_NextTypeInvariantDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM NextTypeInvariant == TypeInvariant /\ Next => TypeInvariant'
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
