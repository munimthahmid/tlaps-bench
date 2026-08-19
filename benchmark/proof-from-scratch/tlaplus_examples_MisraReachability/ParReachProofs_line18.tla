---- MODULE ParReachProofs_line18 ----
EXTENDS ParReachProofs_line18Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => R!Init /\ [][R!Next]_R!vars
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
