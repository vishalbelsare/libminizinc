include "fzn_inverse.mzn";
include "fzn_inverse_opt.mzn";
include "fzn_inverse_reif.mzn";
include "analyse_all_different.mzn";

/** @group globals.channeling
  Constrains two arrays of int variables, \a f and \a invf, to represent
  inverse functions.  All the values in each array must be within the index
  set of the other array.
*/
predicate inverse(array [$$X] of var $$Y: f, array [$$Y] of var $$X: invf) =
  analyse_all_different(f) /\
    analyse_all_different(invf) /\
    fzn_inverse(index2int(enum2int(f)), index2int(enum2int(invf)));

predicate inverse(array [$$X] of var opt $$Y: f, array [$$Y] of var opt $$X: invf) =
  analyse_all_different(f) /\
    analyse_all_different(invf) /\
    fzn_inverse_opt(index2int(enum2int(f)), index2int(enum2int(invf)));
