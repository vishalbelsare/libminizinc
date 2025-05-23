include "fzn_disjunctive_strict_opt.mzn";
include "fzn_disjunctive_strict_opt_reif.mzn";

/** @group globals.scheduling
  Requires that a set of tasks given by start times \a s and durations \a d
  do not overlap in time. Tasks with duration 0 CANNOT be scheduled at any time,
  but only when no other task is running. Start times are optional variables, so
  that absent tasks do not need to be scheduled.

  Assumptions:

  - forall \p i, \a d[\p i] >= 0
*/
predicate disjunctive_strict(array [$$T] of var opt int: s, array [$$T] of var int: d) =
  assert(
    index_sets_agree(s, d),
    "disjunctive: the array arguments must have identical index sets",
    fzn_disjunctive_strict_opt(index2int(s), index2int(d)),
  );
