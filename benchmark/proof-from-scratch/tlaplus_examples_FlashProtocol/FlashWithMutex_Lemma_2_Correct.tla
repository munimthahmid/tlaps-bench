---- MODULE FlashWithMutex_Lemma_2_Correct ----
EXTENDS FlashWithMutex_Lemma_2_CorrectDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Lemma_2_Correct == Spec => []Lemma_2
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
