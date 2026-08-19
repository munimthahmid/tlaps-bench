---- MODULE FindHighest_DoneIndexValueThm ----
EXTENDS FindHighest_DoneIndexValueThmDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM DoneIndexValueThm == Spec => []DoneIndexValue
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
