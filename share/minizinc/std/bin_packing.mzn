include "fzn_bin_packing.mzn";
include "fzn_bin_packing_reif.mzn";

/**  @group globals.packing
  Requires that each item \p i with weight \a w[\p i], be put into \a bin[\p i] such
  that the sum of the weights of the items in each bin does not exceed the
  capacity \a c.

  Assumptions:

  - forall \p i, \a w[\p i] >=0
  - \a c >=0

*/
predicate bin_packing(int: c, array [$$I] of var $$B: bin, array [$$I] of int: w) =
  assert(
    index_set(bin) == index_set(w),
    "bin_packing: the bin and weight arrays must have identical index sets",
    assert(
      length(w) == 0 \/ lb_array(w) >= 0,
      "bin_packing: the weights must be non-negative",
      assert(
        c >= 0,
        "bin_packing: capacity must be non-negative",
        fzn_bin_packing(c, index2int(enum2int(bin)), index2int(w)),
      ),
    ),
  );

%-----------------------------------------------------------------------------%
