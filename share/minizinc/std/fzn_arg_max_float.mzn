predicate fzn_maximum_arg_float(array [int] of var float: x, var int: i) =
  let {
    int: l = min(index_set(x));
    int: u = max(index_set(x));
    float: uy = ub_array(x);
  } in if exists (j in l..u) (lb(x[j]) = uy) then
    let {
      array [l..u] of var bool: d;
    } in % max is known to be uy
    x[i] = uy /\ % ith case must be equal to ub
      forall (j in l..u) (x[j] = uy -> i <= j) /\ % lower bound
      d[l] = (x[l] = uy) /\
      forall (j in l + 1..u) (d[j] <-> (d[j - 1] \/ (x[j] = uy))) /\
      forall (j in l..u) (not d[j] -> i >= j + 1) % upper bound
  else
    let {
      float: ly = lb_array(x);
      array [l..u] of var ly..uy: y;
      array [l..u] of var l..u: mi;
    } in y[l] = x[l] /\
      mi[l] = l /\
      i = mi[u] /\
      forall (j in l + 1..u) (
        y[j] == max(x[j], y[j - 1]) /\ mi[j] = if y[j - 1] >= x[j] then mi[j - 1] else j endif
      )
  endif;
