-------------------------------- MODULE LockHS_P_Spec --------------------------------

EXTENDS Lock, NaturalsInduction

VARIABLE h_turn
NoHistoryChange(A) == A /\ UNCHANGED h_turn

VARIABLE s
INSTANCE Stuttering

-------------------------------------------------------------------------------

Other(p) == IF p = 1 THEN 2 ELSE 1 

InitHS == Init /\ (h_turn = 1) /\ (s = top)

l1HS(self) == 
  /\ PostStutter(l1(self), "l1", self, 1, 2, LAMBDA j : j-1)
  /\ h_turn' = IF s' # top THEN IF s'.val = 1 THEN Other(self)
                                              ELSE h_turn
                           ELSE h_turn

procHS(self) == 
  \/ NoStutter(NoHistoryChange(l0(self)))
  \/ l1HS(self)
  \/ NoStutter(NoHistoryChange(cs(self)))
  \/ NoStutter(NoHistoryChange(l2(self)))

NextHS == (\E self \in 1..2: procHS(self))

SpecHS == InitHS /\ [][NextHS]_<<vars, h_turn, s>>

-------------------------------------------------------------------------------

pc_translation(self, label, stutter) == 
  CASE (label = "l0") -> "a0"
    [] (label = "l1") -> "a1"
    [] (label = "l2") -> "a4"
    [] (label = "cs") -> IF stutter = top THEN "cs"
                         ELSE IF stutter.ctxt # self THEN "cs"
                         ELSE IF stutter.val = 2 THEN "a2"
                         ELSE IF stutter.val = 1 THEN "a3"
                         ELSE "error"
c_translation(alt_label) == 
  alt_label \in {"a2", "a3", "cs", "a4"}

P == INSTANCE Peterson WITH
      pc <- [p \in ProcSet |-> pc_translation(p, pc[p], s)],
      c <- [p \in ProcSet |-> c_translation(pc_translation(p, pc[p], s))],
      turn <- h_turn

-------------------------------------------------------------------------------

THEOREM SpecHS => P!Spec
PROOF OBVIOUS

===============================================================================