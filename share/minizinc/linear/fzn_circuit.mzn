include "alldifferent.mzn";

% Linear version.
predicate fzn_circuit(array [int] of var int: x) =
  if length(x) = 0 then
    true
  else
    let {
      set of int: S = index_set(x);
      int: l = min(S);
      int: u = max(S);
      int: n = card(S);
      constraint forall (i in S) (x[i] in S diff {i}); %% Self-mapping and exclude i->i before alldifferent
    } in alldifferent(x) /\
      %    alldifferent(order) /\
      if nMZN__fSECcuts > 0 then
        let {
          array [int, int] of var int: eq_x = eq_encode(x);
          constraint assert(l == min(index_set_2of2(eq_x)), "circuit: index set mismatch"); %% self-mapping
          constraint assert(u == max(index_set_2of2(eq_x)), "circuit: index set mismatch");
        } in circuit__SECcuts(array1d(eq_x))
      else
        true
      endif /\
      if nMZN__fSECcuts < 2 then
        %%% MTZ model. Note that INTEGER order vars seem better!:
        let {
          array [l + 1..l + n - 1] of var 2..n: order;
        } in forall (i, j in l + 1..l + n - 1 where i != j /\ j in dom(x[i])) (
          order[i] - order[j] + (n - 1) * bool2int(x[i] == j) + (n - 3) * bool2int(x[j] == i) <= %% the Desrochers & Laporte '91 term
            %%%%  --- strangely enough it is much worse on vrp-s2-v2-c7_vrp-v2-c7_det_ADAPT_1_INVERSE.mzn!
            n - 2
        )
      else
        true
      endif /\
      %% ... but seems improved with this (leaving also for SEC)
      if n > 2 then
        forall (i, j in S where i < j) (x[i] != j \/ x[j] != i) %% Only this improves overall with DL'91
      else
        true
      endif
  endif;

%-----------------------------------------------------------------------------%
predicate circuit__SECcuts(array [int] of var int: x); %% passed on
%-----------------------------------------------------------------------------%
