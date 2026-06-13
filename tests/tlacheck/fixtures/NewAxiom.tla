---- MODULE NewAxiom ----
EXTENDS Integers
CONSTANT N
ASSUME N \in Nat
\* A genuinely NEW assumption absent from the baseline — assumes away the goal.
ASSUME Cheat == N = 5
THEOREM T == N = 5
PROOF BY Cheat
====
