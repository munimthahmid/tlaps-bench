---- MODULE Zab_PrimaryIntegrity ----
EXTENDS Zab_PrimaryIntegrityDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []PrimaryIntegrity
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
