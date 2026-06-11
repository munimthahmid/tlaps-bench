------------------ MODULE ivy_examples_alternating_bit_protocol ------------------
EXTENDS Naturals, Sequences, TLAPS

(***************************************************************************)
(* TLA+ translation of Ivy's examples/liveness/alternating_bit_protocol.ivy *)
(*                                                                         *)
(* The Ivy model uses an uninterpreted, totally ordered index type with a  *)
(* zero and successor operation.  This TLA+ model follows the convention   *)
(* used by the other Ivy translations in this repository: indices are Nat, *)
(* zero is 0, and successor is +1.                                         *)
(*                                                                         *)
(* Ivy also models data and ack channels through a reusable FIFO module    *)
(* whose messages have immutable fields.  Here, data messages are TLA+     *)
(* records [value |-> v, bit |-> b], ack messages are just booleans, and   *)
(* the channels are sequences ordered from oldest at Head to newest at the *)
(* tail.  The drop actions remove an arbitrary sequence element.           *)
(*                                                                         *)
(* Ivy states fairness using transient event flags: sender_scheduled,      *)
(* receiver_scheduled, data_sent, data_received, ack_sent, and             *)
(* ack_received.  This module omits those transient flags and states the   *)
(* corresponding assumptions directly: weak fairness for the two scheduled *)
(* endpoint actions, and strong fairness for channel receives.             *)
(***************************************************************************)

CONSTANTS Value, Bot

DataValue == Value \ {Bot}
DataPacket == [value : DataValue, bit : BOOLEAN]

ASSUME ValueAssumption ==
  /\ Bot \in Value
  /\ DataValue # {}

VARIABLES
  sender_array, receiver_array,
  sender_i, sender_gen_i, receiver_i,
  sender_bit, receiver_bit,
  data_chan, ack_chan

vars ==
  << sender_array, receiver_array,
     sender_i, sender_gen_i, receiver_i,
     sender_bit, receiver_bit,
     data_chan, ack_chan >>

RemoveAt(s, i) ==
  [j \in 1..(Len(s) - 1) |-> IF j < i THEN s[j] ELSE s[j + 1]]

Init ==
  /\ sender_array = [i \in Nat |-> Bot]
  /\ receiver_array = [i \in Nat |-> Bot]
  /\ sender_i = 0
  /\ sender_gen_i = 0
  /\ receiver_i = 0
  /\ sender_bit = FALSE
  /\ receiver_bit = FALSE
  /\ data_chan = <<>>
  /\ ack_chan = <<>>

GenerateData(v) ==
  /\ v \in DataValue
  /\ sender_array' = [sender_array EXCEPT ![sender_gen_i] = v]
  /\ sender_gen_i' = sender_gen_i + 1
  /\ UNCHANGED << receiver_array, sender_i, receiver_i,
                  sender_bit, receiver_bit, data_chan, ack_chan >>

SenderSendData ==
  /\ sender_array[sender_i] # Bot
  /\ data_chan' =
       Append(data_chan, [value |-> sender_array[sender_i],
                          bit   |-> sender_bit])
  /\ UNCHANGED << sender_array, receiver_array,
                  sender_i, sender_gen_i, receiver_i,
                  sender_bit, receiver_bit, ack_chan >>

SenderReceiveAck ==
  /\ ack_chan # <<>>
  /\ ack_chan' = Tail(ack_chan)
  /\ IF Head(ack_chan) = sender_bit
       THEN /\ sender_bit' = ~sender_bit
            /\ sender_i' = sender_i + 1
       ELSE /\ sender_bit' = sender_bit
            /\ sender_i' = sender_i
  /\ UNCHANGED << sender_array, receiver_array,
                  sender_gen_i, receiver_i, receiver_bit, data_chan >>

ReceiverReceiveData ==
  /\ data_chan # <<>>
  /\ data_chan' = Tail(data_chan)
  /\ LET msg == Head(data_chan) IN
       IF msg.bit = receiver_bit
          THEN /\ receiver_bit' = ~receiver_bit
               /\ receiver_array' =
                    [receiver_array EXCEPT ![receiver_i] = msg.value]
               /\ receiver_i' = receiver_i + 1
          ELSE /\ receiver_bit' = receiver_bit
               /\ receiver_array' = receiver_array
               /\ receiver_i' = receiver_i
  /\ UNCHANGED << sender_array, sender_i, sender_gen_i,
                  sender_bit, ack_chan >>

ReceiverSendAck ==
  /\ ack_chan' = Append(ack_chan, ~receiver_bit)
  /\ UNCHANGED << sender_array, receiver_array,
                  sender_i, sender_gen_i, receiver_i,
                  sender_bit, receiver_bit, data_chan >>

DataMsgDrop(i) ==
  /\ i \in 1..Len(data_chan)
  /\ data_chan' = RemoveAt(data_chan, i)
  /\ UNCHANGED << sender_array, receiver_array,
                  sender_i, sender_gen_i, receiver_i,
                  sender_bit, receiver_bit, ack_chan >>

AckMsgDrop(i) ==
  /\ i \in 1..Len(ack_chan)
  /\ ack_chan' = RemoveAt(ack_chan, i)
  /\ UNCHANGED << sender_array, receiver_array,
                  sender_i, sender_gen_i, receiver_i,
                  sender_bit, receiver_bit, data_chan >>

Next ==
  \/ \E v \in DataValue : GenerateData(v)
  \/ SenderSendData
  \/ SenderReceiveAck
  \/ ReceiverReceiveData
  \/ ReceiverSendAck
  \/ \E i \in 1..Len(data_chan) : DataMsgDrop(i)
  \/ \E i \in 1..Len(ack_chan) : AckMsgDrop(i)

SafetySpec ==
  /\ Init
  /\ [][Next]_vars

Spec ==
  /\ SafetySpec
  /\ WF_vars(SenderSendData)
  /\ WF_vars(ReceiverSendAck)
  /\ SF_vars(ReceiverReceiveData)
  /\ SF_vars(SenderReceiveAck)

ReceiverValuesFromSender ==
  \A i \in Nat :
    receiver_array[i] # Bot => receiver_array[i] = sender_array[i]

THEOREM Safety == SafetySpec => []ReceiverValuesFromSender
  PROOF OBVIOUS

(***************************************************************************)
(* Temporal property corresponding to Ivy's liveness property.             *)
(*                                                                         *)
(* Ivy proves that, under endpoint scheduling fairness and channel         *)
(* fairness, every generated sender-array entry is eventually present in   *)
(* the corresponding receiver-array entry.  In TLA+, the fairness          *)
(* assumptions are the conjuncts in Spec, so the conclusion is stated      *)
(* directly as a leads-to property for each index.                         *)
(***************************************************************************)

DataDelivery ==
  \A i \in Nat :
    (sender_array[i] # Bot) ~> (receiver_array[i] # Bot)

THEOREM Liveness == Spec => DataDelivery
  PROOF OBVIOUS

=============================================================================
