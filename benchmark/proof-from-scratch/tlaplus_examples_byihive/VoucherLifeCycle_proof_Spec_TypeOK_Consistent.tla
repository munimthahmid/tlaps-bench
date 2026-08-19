---- MODULE VoucherLifeCycle_proof_Spec_TypeOK_Consistent ----
EXTENDS VoucherLifeCycle_proof_Spec_TypeOK_ConsistentDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec_TypeOK_Consistent == VSpec => []Inv
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
