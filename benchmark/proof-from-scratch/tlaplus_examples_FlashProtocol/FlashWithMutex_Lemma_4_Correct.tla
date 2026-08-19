---- MODULE FlashWithMutex_Lemma_4_Correct ----
EXTENDS FlashWithMutex_Lemma_4_CorrectDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Lemma_4_Correct == Spec => []Lemma_4
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
