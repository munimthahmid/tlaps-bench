---- MODULE FlashWithMutex_Lemma_1_Correct ----
EXTENDS FlashWithMutex_Lemma_1_CorrectDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Lemma_1_Correct == Spec => []Lemma_1
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
