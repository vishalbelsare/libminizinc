predicate fzn_regular_nfa(
  array [int] of var int: x,
  int: Q,
  int: S,
  array [int, int] of set of int: d,
  int: q0,
  set of int: F,
) =
  if length(x) = 0 then
    q0 in F
  else
    let {
      % If x has index set m..n-1, then a[m] holds the initial state
      % (q0), and a[i+1] holds the state we're in after  processing
      % x[i].  If a[n] is in F, then we succeed (ie. accept the string).
      int: m = min(index_set(x));
      int: n = max(index_set(x)) + 1;
      array [m..n] of var 1..Q: a;
    } in a[m] = q0 /\ % Set a[0].
      forall (
        i in index_set(x),
      ) (
        x[i] in 1..S /\ % Do this in case it's a var.
          a[i + 1] in d[a[i], x[i]] % Determine a[i+1].
      ) /\
      a[n] in F % Check the final state is in F.
  endif;
