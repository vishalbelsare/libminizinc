predicate fzn_disjunctive_opt_reif(
  array [int] of var opt int: s,
  array [int] of var int: d,
  var bool: b,
) =
  b <->
    forall (i, j in index_set(d) where i < j) (
      absent(s[i]) \/
        absent(s[j]) \/
        d[i] = 0 \/
        d[j] = 0 \/
        deopt(s[i]) + d[i] <= deopt(s[j]) \/
        deopt(s[j]) + d[j] <= deopt(s[i])
    );
