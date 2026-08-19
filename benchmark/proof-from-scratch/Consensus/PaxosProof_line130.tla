---- MODULE PaxosProof_line130 ----
EXTENDS PaxosProof_line130Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Next /\ Inv => V!Next \/ UNCHANGED <<votes,maxBal>>
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
