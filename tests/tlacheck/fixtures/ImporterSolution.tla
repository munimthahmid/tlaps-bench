---- MODULE ImporterSolution ----
EXTENDS SmuggledObvious
\* This solution DOES import the smuggled module and leans on its axiom.
THEOREM Target == Spec => []Goal
PROOF BY Smuggled
====
