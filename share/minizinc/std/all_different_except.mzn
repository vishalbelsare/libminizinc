include "fzn_alldifferent_except.mzn";
include "fzn_alldifferent_except_reif.mzn";

/**  @group globals.alldifferent
  Constrain the elements of the array of integers \a vs to be pairwise different except for those
  values that appear in the set \a S.
*/
predicate all_different_except(array [$X] of var $$E: vs, set of $$E: S) =
  fzn_alldifferent_except(enum2int(array1d(vs)), enum2int(S));

% Synonym for the above.
predicate alldifferent_except(array [$X] of var $$E: vs, set of $$E: S) =
  all_different_except(vs, S);
