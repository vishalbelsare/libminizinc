predicate fzn_sum_set(
  array [int] of int: vs,
  array [int] of int: ws,
  var set of int: x,
  var int: s,
) = s == sum (j in index_set(vs)) ((vs[j] in x) * ws[j]);
