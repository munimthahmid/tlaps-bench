---- MODULE CigaretteSmokers_proof_AtMostOneCorrect ----
EXTENDS CigaretteSmokers_proof_AtMostOneCorrectDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM AtMostOneCorrect == Spec => []AtMostOne
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
