---- MODULE ivy_examples_ticket_Safety ----
EXTENDS ivy_examples_ticket_SafetyDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Safety == SafetySpec => []MutualExclusion
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
