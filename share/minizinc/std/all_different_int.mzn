include "fzn_all_different_int.mzn";
include "fzn_all_different_int_reif.mzn";

%-----------------------------------------------------------------------------%
% Constrains the array of objects 'x' to be all different.
%-----------------------------------------------------------------------------%

predicate all_different_int(array [int] of var int: x) = fzn_all_different_int(x);
