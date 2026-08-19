---- MODULE Zab_Integrity ----
EXTENDS Zab_IntegrityDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Integrity
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
