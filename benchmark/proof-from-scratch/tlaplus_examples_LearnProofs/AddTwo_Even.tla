---- MODULE AddTwo_Even ----
EXTENDS AddTwo_EvenDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []Even
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
