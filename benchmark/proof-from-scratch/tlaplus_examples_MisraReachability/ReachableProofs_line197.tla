---- MODULE ReachableProofs_line197 ----
EXTENDS ReachableProofs_line197Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []((pc = "Done") => (marked = Reachable))
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
