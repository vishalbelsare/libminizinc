include "fzn_increasing_set.mzn";
include "fzn_increasing_set_reif.mzn";

%-----------------------------------------------------------------------------%
% Requires that the array 'x' is in increasing order (duplicates are allowed).
%-----------------------------------------------------------------------------%

predicate increasing_set(array [$X] of var set of int: x) = fzn_increasing_set(array1d(x));
