predicate fzn_geost_nonoverlap_k_reif(
  array [int] of var int: x1,
  array [int] of int: w1,
  array [int] of var int: x2,
  array [int] of int: w2,
  var bool: b,
) =
  % Non-overlap constraint
  b <-> exists (j in index_set(x1)) (x1[j] + w1[j] <= x2[j] \/ x2[j] + w2[j] <= x1[j]);
