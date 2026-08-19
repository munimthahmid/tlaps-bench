---- MODULE PaxosProof_StructOK1 ----
EXTENDS PaxosProof_StructOK1Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []StructOK1
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
