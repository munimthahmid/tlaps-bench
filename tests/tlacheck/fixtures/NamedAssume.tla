---- MODULE NamedAssume ----
EXTENDS Integers
CONSTANT N
\* Same proposition as the baseline's unnamed assume, only LABELLED so it can be
\* cited BY name. Not a new axiom.
ASSUME NType == N \in Nat
THEOREM T == N + 0 = N
PROOF BY NType
====
