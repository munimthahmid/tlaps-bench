---- MODULE HourClock_proof_HCini_Invariant ----
EXTENDS HourClock_proof_HCini_InvariantDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM HCini_Invariant == HC => []HCini
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
