predicate fzn_bin_packing_load(
  array [int] of var int: load,
  array [int] of var int: bin,
  array [int] of int: w,
) =
  sum(load) = sum(w) /\
    forall (i in index_set(bin)) (
      min(index_set(load)) <= bin[i] /\ bin[i] <= max(index_set(load))
    ) /\
    forall (b in index_set(load)) (load[b] = sum (i in index_set(bin)) (w[i] * (bin[i] = b)));

%-----------------------------------------------------------------------------%
