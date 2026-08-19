---- MODULE Zab_LocalPrimaryOrder ----
EXTENDS Zab_LocalPrimaryOrderDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []LocalPrimaryOrder
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
