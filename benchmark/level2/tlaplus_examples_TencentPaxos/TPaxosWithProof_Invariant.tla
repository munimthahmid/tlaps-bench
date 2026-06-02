------------------------------ MODULE TPaxosWithProof_Invariant --------------------------------

EXTENDS Integers, FiniteSets, TLAPS
-----------------------------------------------------------------------------
Max(m, n) == IF m > n THEN m ELSE n
Injective(f) == \A a, b \in DOMAIN f: (a # b) => (f[a] # f[b])
-----------------------------------------------------------------------------
CONSTANTS
    Participant,  
    Value         

None == CHOOSE b : b \notin Value

NP == Cardinality(Participant) 

Quorum == {Q \in SUBSET Participant : Cardinality(Q) * 2 >= NP + 1}
ASSUME QuorumAssumption ==
    /\ \A Q \in Quorum : Q \subseteq Participant
    /\ \A Q1, Q2 \in Quorum : Q1 \cap Q2 # {}

Ballot == Nat

PIndex == CHOOSE f \in [Participant -> 1 .. NP] : Injective(f)
Bals(p) == {b \in Ballot : b % NP = PIndex[p] - 1} 
-----------------------------------------------------------------------------
State == [maxBal: Ballot \cup {-1},
         maxVBal: Ballot \cup {-1}, maxVVal: Value \cup {None}]

InitState == [maxBal |-> -1, maxVBal |-> -1, maxVVal |-> None]

Message == [from: Participant,
            to : SUBSET Participant,
            state: [Participant -> [maxBal: Ballot \cup {-1},
                                    maxVBal: Ballot \cup {-1},
                                    maxVVal: Value \cup {None}]]]
-----------------------------------------------------------------------------
VARIABLES
    state,  
    msgs    

vars == <<state, msgs>>

TypeOK ==
    /\ state \in [Participant -> [Participant -> State]]

    /\ msgs \subseteq Message

Send(m) == msgs' = msgs \cup {m}
-----------------------------------------------------------------------------
Init ==
    /\ state = [p \in Participant |-> [q \in Participant |-> InitState]]
    /\ msgs = {}

Prepare(p, b) ==
    /\ b \in Bals(p)
    /\ state[p][p].maxBal < b
    /\ state' = [state EXCEPT ![p][p].maxBal = b]
    /\ Send([from |-> p, to |-> Participant \ {p}, state |-> state'[p]])

UpdateState(q, p, pp) ==
    LET maxB == Max(state[q][q].maxBal, pp.maxBal)
        maxBV == IF (maxB <= pp.maxVBal)
                    THEN pp.maxVBal
                    ELSE state[q][q].maxVBal
        maxVV == IF (maxB <= pp.maxVBal)
                    THEN pp.maxVVal
                    ELSE state[q][q].maxVVal
       new_state_qq == [maxBal |-> maxB,
                        maxVBal |-> maxBV,
                        maxVVal |-> maxVV]
       new_state_qp == [maxBal |->  Max(state[q][p].maxBal, pp.maxBal),
                        maxVBal |-> Max(state[q][p].maxVBal, pp.maxVBal),
                        maxVVal |-> (IF (state[q][p].maxVBal =< pp.maxVBal)
                                        THEN pp.maxVVal
                                        ELSE state[q][p].maxVVal)]
    IN  state' =
          [state EXCEPT
              ![q] = [ state[q] EXCEPT
                          ![q] = new_state_qq,
                          ![p] = new_state_qp
                      ]
           ]

OnMessage(q) ==
    \E m \in msgs :
        /\ q \in m.to
        /\ LET p == m.from
           IN  UpdateState(q, p, m.state[p])
        /\ LET qm == [from |-> m.from, to |-> m.to \ {q}, state |-> m.state] 
               nm == [from |-> q, to |-> {m.from}, state |-> state'[q]] 
           IN  IF \/ m.state[q].maxBal < state'[q][q].maxBal
                  \/ m.state[q].maxVBal < state'[q][q].maxVBal
                 THEN msgs' = msgs \cup {nm}
                 ELSE UNCHANGED msgs

Accept(p, b, v) ==
    /\ b \in Bals(p)
    /\ ~ \E m \in msgs: m.state[m.from].maxBal = b /\ m.state[m.from].maxVBal = b
    /\ state[p][p].maxBal = b 
    /\ state[p][p].maxVBal # b 
    /\ \E Q \in Quorum :
       /\ \A q \in Q : state[p][q].maxBal = b
       
       /\ \/ \A q \in Q : state[p][q].maxVBal = -1 

          \/ \E c \in 0..(b-1):
              /\ \A r \in Q: state[p][r].maxVBal =< c
              /\ \E r \in Q: /\ state[p][r].maxVBal = c
                             /\ state[p][r].maxVVal = v

    /\ state' = [state EXCEPT ![p] = [state[p] EXCEPT
                                        ![p] = [state[p][p] EXCEPT !.maxVBal = b,
                                                                   !.maxVVal = v]]]
    /\ Send([from |-> p, to |-> Participant \ {p}, state |-> state'[p]])
---------------------------------------------------------------------------
Next == \E p \in Participant : \/ OnMessage(p)
                               \/ \E b \in Ballot : \/ Prepare(p, b)
                                                    \/ \E v \in Value : Accept(p, b, v)
Spec == Init /\ [][Next]_vars
---------------------------------------------------------------------------
VotedForIn(a, b, v) == \E m \in msgs:
                            /\ m.from = a
                            /\ m.state[a].maxBal = b
                            /\ m.state[a].maxVBal = b
                            /\ m.state[a].maxVVal = v

---------------------------------------------------------------------------
WontVoteIn(a, b) == /\ \A v \in Value: ~ VotedForIn(a, b, v)
                    /\ state[a][a].maxBal > b

SafeAt(b, v) ==
        \A c \in 0..(b-1):
            \E Q \in Quorum:
                \A a \in Q: VotedForIn(a, c, v) \/ WontVoteIn(a, c)

---------------------------------------------------------------------------
MsgInv ==
    \A m \in msgs:
        LET p == m.from
            curState == m.state[p]
         IN /\ curState.maxBal >= curState.maxVBal
            /\ curState.maxBal # curState.maxVBal
                => /\ curState.maxBal =< state[p][p].maxBal
                   /\ \A c \in (curState.maxVBal + 1)..(curState.maxBal - 1):
                        ~ \E v \in Value: VotedForIn(p, c, v)
            /\ curState.maxBal = curState.maxVBal 
                => /\ SafeAt(curState.maxVBal, curState.maxVVal)
                   /\ \A ma \in msgs: (ma.state[ma.from].maxBal = curState.maxBal
                                       /\ ma.state[ma.from].maxBal = ma.state[ma.from].maxVBal)
                                    => ma.state[ma.from].maxVVal = curState.maxVVal
            /\\/ /\ curState.maxVVal \in Value
                 /\ curState.maxVBal \in Ballot
                 /\ VotedForIn(m.from, curState.maxVBal, curState.maxVVal)
              \/ /\ curState.maxVVal = None
                 /\ curState.maxVBal = -1
            /\ curState.maxBal \in Ballot
            /\ m.from \notin m.to
            /\ \A q \in Participant: /\ m.state[q].maxVBal <= state[q][q].maxVBal
                                     /\ m.state[q].maxBal <= state[q][q].maxBal
AccInv ==
    \A a \in Participant:
        /\ (state[a][a].maxVBal = -1) <=> (state[a][a].maxVVal = None)
        /\ \A q \in Participant: state[a][q].maxVBal <= state[a][q].maxBal
        /\ (state[a][a].maxVBal >= 0) => VotedForIn(a, state[a][a].maxVBal, state[a][a].maxVVal)
        /\ \A c \in Ballot: c > state[a][a].maxVBal
            => ~ \E v \in Value: VotedForIn(a, c, v)
        /\ \A q \in Participant:
            /\ state[a][a].maxBal >= state[q][a].maxBal
            /\ state[a][a].maxVBal >= state[q][a].maxVBal
        /\ \A q \in Participant:
                state[a][q].maxBal \in Ballot
                        => \E m \in msgs:
                              /\ m.from = q
                              /\ m.state[q].maxBal = state[a][q].maxBal
                              /\ m.state[q].maxVBal = state[a][q].maxVBal
                              /\ m.state[q].maxVVal = state[a][q].maxVVal

Inv == MsgInv /\ AccInv /\ TypeOK
--------------------------------------------------------------------------

--------------------------------------------------------------------------

--------------------------------------------------------------------------
THEOREM Invariant == Spec => []Inv
PROOF OBVIOUS

--------------------------------------------------------------------------
---------------------------------------------------------------------------

=============================================================================

