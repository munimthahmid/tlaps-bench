---- MODULE Zab_Agreement ----
EXTENDS Zab_AgreementDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Agreement
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
