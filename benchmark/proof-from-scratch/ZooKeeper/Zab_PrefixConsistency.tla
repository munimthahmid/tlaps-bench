---- MODULE Zab_PrefixConsistency ----
EXTENDS Zab_PrefixConsistencyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []PrefixConsistency
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
