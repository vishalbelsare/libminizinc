include "fzn_table_bool.mzn";
include "fzn_table_bool_reif.mzn";
include "fzn_table_int.mzn";
include "fzn_table_int_reif.mzn";
include "fzn_table_int_opt.mzn";

/** @group globals.extensional
  Represents the constraint \a x in \a t where we
  consider each row in \a t to be a tuple and \a t as a set of tuples.
*/
predicate table(array [$$E] of var bool: x, array [$$X, $$E] of bool: t) =
  assert(
    index_set_2of2(t) == index_set(x),
    "The second dimension of the table must equal the number of variables " ++
      "in the first argument",
  ) /\
    fzn_table_bool(index2int(x), index2int(t));

/** @group globals.extensional
  Represents the constraint \a x in \a t where we
  consider each row in \a t to be a tuple and \a t as a set of tuples.
*/
predicate table(array [$$E] of var int: x, array [$$X, $$E] of int: t) =
  assert(
    index_set_2of2(t) == index_set(x),
    "The second dimension of the table must equal the number of variables " ++
      "in the first argument",
  ) /\
    fzn_table_int(index2int(x), index2int(t));

/** @group globals.extensional
  Represents the constraint \a x in \a t if the variable \a x_i and the value
  \a t_i occur where we consider each row in \a t to be a tuple and \a t as a
  set of tuples.
*/
predicate table(array [$$E] of var opt int: x, array [$$X, $$E] of opt int: t) =
  assert(
    index_set_2of2(t) == index_set(x),
    "The second dimension of the table must equal the number of variables " ++
      "in the first argument",
  ) /\
    fzn_table_int_opt(index2int(x), index2int(t));
