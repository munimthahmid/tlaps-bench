------------------------------ MODULE AddTwo_TypeInvariant --------------------------------

EXTENDS Naturals, TLAPS

VARIABLE x

vars == << x >>

Init == 
        /\ x = 0

Next == x' = x + 2

Spec == Init /\ [][Next]_vars

TypeOK == x \in Nat

THEOREM TypeInvariant == Spec => []TypeOK
PROOF OBVIOUS

=============================================================================

