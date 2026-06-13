---- MODULE BaselineAssume ----
EXTENDS Integers
CONSTANT N
ASSUME N \in Nat
THEOREM T == N + 0 = N
PROOF OBVIOUS
====
