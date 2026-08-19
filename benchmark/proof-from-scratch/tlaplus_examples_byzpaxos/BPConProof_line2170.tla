---- MODULE BPConProof_line2170 ----
EXTENDS BPConProof_line2170Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM chosen \subseteq P!chosen
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
