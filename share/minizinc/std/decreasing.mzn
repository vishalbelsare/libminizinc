include "increasing.mzn";

/** @group globals.sort Requires that the array \a x is in decreasing order (duplicates are allowed). */
predicate decreasing(array [$X] of var bool: x) = increasing(reverse(array1d(x)));

/** @group globals.sort Requires that the array \a x is in decreasing order (duplicates are allowed). */
predicate decreasing(array [$X] of var opt float: x) = increasing(reverse(array1d(x)));

/** @group globals.sort Requires that the array \a x is in decreasing order (duplicates are allowed). */
predicate decreasing(array [$X] of var opt $$E: x) = increasing(reverse(array1d(x)));

/** @group globals.sort Requires that the array \a x is in decreasing order (duplicates are allowed). */
predicate decreasing(array [$X] of var set of $$E: x) = increasing(reverse(array1d(x)));
