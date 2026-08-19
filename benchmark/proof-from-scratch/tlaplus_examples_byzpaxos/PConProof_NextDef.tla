---- MODULE PConProof_NextDef ----
EXTENDS PConProof_NextDefDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM NextDef == (Next <=> TLANext)
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
