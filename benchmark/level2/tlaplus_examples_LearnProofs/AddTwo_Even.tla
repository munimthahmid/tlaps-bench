------------------------------ MODULE AddTwo_Even --------------------------------

EXTENDS Naturals, TLAPS

VARIABLE x

vars == << x >>

Init == 
        /\ x = 0

Next == x' = x + 2

Spec == Init /\ [][Next]_vars

a|b == \E c \in Nat : a*c = b

Even == 2|x

THEOREM Spec => []Even
PROOF OBVIOUS

=============================================================================

