---- MODULE Voting_proof_ShowsSafety_T ----
EXTENDS Voting_proof_ShowsSafety_TDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM ShowsSafety_T ==
    Inv => \A Q \in Quorum, b \in Ballot, v \in Value :
              ShowsSafeAt(Q, b, v) => SafeAt(b, v)
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
