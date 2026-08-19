---- MODULE GermanData_DirectoryAccurate ----
EXTENDS GermanData_DirectoryAccurateDefs

LOCAL INSTANCE TLAPS
LOCAL NatInductionLib == INSTANCE NaturalsInduction
LOCAL FiniteSetTheoremsLib == INSTANCE FiniteSetTheorems
LOCAL WellFoundedInductionLib == INSTANCE WellFoundedInduction

\* BEGIN AGENT HELPERS
\* END AGENT HELPERS
THEOREM Spec => []DirectoryAccurate
\* BEGIN AGENT PROOF
PROOF OBVIOUS
\* END AGENT PROOF
====
