---------------------------- MODULE SumSequence_PCorrect ----------------------------

EXTENDS Integers, SequenceTheorems, SequencesExtTheorems, NaturalsInduction, TLAPS

CONSTANT Values
ASSUME  ValAssump == Values \subseteq Int

SeqSum(s) == 
  LET SS[ss \in Seq(Int)] == IF ss = << >> THEN 0 ELSE ss[1] + SS[Tail(ss)]
  IN  SS[s]

VARIABLES pc, seq, sum, n

vars == << pc, seq, sum, n >>

Init == 
        /\ seq \in Seq(Values)
        /\ sum = 0
        /\ n = 1
        /\ pc = "a"

a == /\ pc = "a"
     /\ IF n =< Len(seq)
           THEN /\ sum' = sum + seq[n]
                /\ n' = n+1
                /\ pc' = "a"
           ELSE /\ pc' = "Done"
                /\ UNCHANGED << sum, n >>
     /\ seq' = seq

Terminating == pc = "Done" /\ UNCHANGED vars

Next == a
           \/ Terminating

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Next)

-----------------------------------------------------------------------------

PCorrect == (pc = "Done") => (sum = SeqSum(seq))

-----------------------------------------------------------------------------

-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
THEOREM Spec => []PCorrect
PROOF OBVIOUS
-----------------------------------------------------------------------------

=============================================================================

