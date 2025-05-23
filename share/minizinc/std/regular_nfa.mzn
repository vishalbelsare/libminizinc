include "fzn_regular_nfa.mzn";
include "fzn_regular_nfa_reif.mzn";
include "fzn_regular_nfa_set.mzn";
include "fzn_regular_nfa_set_reif.mzn";

/** @group globals.extensional
  The sequence of values in array \a x
  is accepted by the NFA with transition
  function \a d, initial state \a q0 and accepting states \a F.
  The transition function maps states (from enumerated type \a State) and
  values (from type \a Val) to sets of states.  
*/
predicate regular_nfa(
  array [$$X] of var $$Val: x,
  array [$$State, $$Val] of set of $$State: d,
  $$State: q0,
  set of $$State: F,
) =
  let {
    any: State = enum2int(index_set_1of2(d));
    any: Val = enum2int(index_set_2of2(d));
    any: q_off = min(State) - 1;
    any: dd = array2d(State, Val, [{enum2int(i) - q_off | i in d_sv} | d_sv in d]);
    any: qq0 = enum2int(q0) - q_off;
    any: FF = {enum2int(i) - q_off | i in F};
  } in fzn_regular_nfa(index2int(enum2int(x)), card(State), Val, dd, qq0, FF);

/** @group globals.extensional
  The sequence of values in array \a x (which must all be in the range 1..\a S)
  is accepted by the NFA of \a Q states with input 1..\a S and transition
  function \a d (which maps (1..\a Q, 1..\a S) -> set of 1..\a Q)) and initial state \a q0
  (which must be in 1..\a Q) and accepting states \a F (which all must be in
  1..\a Q).
*/
predicate regular_nfa(
  array [int] of var int: x,
  int: Q,
  int: S,
  array [int, int] of set of int: d,
  int: q0,
  set of int: F,
) =
  assert(Q > 0, "regular_nfa: 'Q' must be greater than zero") /\
    assert(S > 0, "regular_nfa: 'S' must be greater than zero") /\
    assert(
      index_set_1of2(d) = 1..Q /\ index_set_2of2(d) == 1..S,
      "regular_nfa: the transition function 'd' must be [1..Q,1..S]",
    ) /\
    assert(
      forall([d[i, j] subset 1..Q | i in 1..Q, j in 1..S]),
      "regular_nfa: transition function 'd' points to states outside 1..Q",
    ) /\
    assert(
      (
        % Nb: we need the parentheses around the expression otherwise the
        % parser thinks it's a generator call!
        q0 in 1..Q
      ),
      "regular_nfa: start state 'q0' not in 1..Q",
    ) /\
    assert(F subset 1..Q, "regular_nfa: final states in 'F' contain states outside 1..Q") /\
    fzn_regular_nfa(x, Q, S, d, q0, F);

/** @group globals.extensional
  The sequence of values in array \a x (which must all be in the range \a S)
  is accepted by the NFA of \a Q states with input \a S and transition
  function \a d (which maps (1..\a Q, \a S) -> set of 1..\a Q)) and initial state \a q0
  (which must be in 1..\a Q) and accepting states \a F (which all must be in
  1..\a Q).
*/
predicate regular_nfa(
  array [int] of var int: x,
  int: Q,
  set of int: S,
  array [int, int] of set of int: d,
  int: q0,
  set of int: F,
) =
  assert(Q > 0, "regular_nfa: 'Q' must be greater than zero") /\
    assert(card(S) > 0, "regular_nfa: 'S' must be non empty") /\
    assert(S = min(S)..max(S), "regular_nfa: 'S' must be a range") /\
    assert(
      index_set_1of2(d) = 1..Q /\ index_set_2of2(d) == S,
      "regular_nfa: the transition function 'd' must be [1..Q,S]",
    ) /\
    assert(
      forall([d[i, j] subset 1..Q | i in 1..Q, j in S]),
      "regular_nfa: transition function 'd' points to states outside 1..Q",
    ) /\
    assert(
      (
        % Nb: we need the parentheses around the expression otherwise the
        % parser thinks it's a generator call!
        q0 in 1..Q
      ),
      "regular_nfa: start state 'q0' not in 1..Q",
    ) /\
    assert(F subset 1..Q, "regular_nfa: final states in 'F' contain states outside 1..Q") /\
    fzn_regular_nfa(x, Q, S, d, q0, F);
