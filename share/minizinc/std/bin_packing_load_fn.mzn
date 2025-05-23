include "fzn_bin_packing_load.mzn";

/**  @group globals.packing
  Returns the load of each bin resulting from packing each item \p i with
  weight \a w[\p i] into \a bin[\p i], where the load is defined as
  the sum of the weights of the items in each bin.

  Assumptions:

  - forall \p i, \a w[\p i] >=0
*/
function array [$$B] of var int: bin_packing_load(
  array [$$I] of var $$B: bin,
  array [$$I] of int: w,
) :: promise_total =
  assert(
    index_set(bin) == index_set(w),
    "bin_packing_load: the bin and weight arrays must have identical index sets",
    if length(bin) > 0 then
      let {
        array [dom_bounds_array(bin)] of var 0..sum(w): load :: is_defined_var;
        constraint
          fzn_bin_packing_load(index2int(load), index2int(enum2int(bin)), index2int(w))
            :: defines_var(load);
      } in load
    endif,
  );
