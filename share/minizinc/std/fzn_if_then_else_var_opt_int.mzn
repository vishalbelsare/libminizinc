predicate fzn_if_then_else_var_opt_int(
  array [int] of var bool: c,
  array [int] of var opt int: x,
  var opt int: y,
) =
  let {
    array [index_set(c)] of var bool: d;
  } in forall (i in index_set(c)) (
    if i > min(index_set(c)) then d[i] = (not c[i - 1] /\ d[i - 1]) else d[i] = true endif
  ) /\
    forall (i in index_set(c)) (c[i] /\ d[i] -> y = x[i]);
