---- MODULE OpenAddressing_CompleteAsSafety ----
EXTENDS OpenAddressing_CompleteAsSafetyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []CompleteAsSafety
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
