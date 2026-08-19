---- MODULE GCD_GCD3 ----
EXTENDS GCD_GCD3Defs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM GCD3 == \A m, n \in Nat \ {0} : 
                    (n > m) => (GCD(m, n) = GCD(m, n-m))
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
