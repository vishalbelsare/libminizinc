include "distribute.mzn";

/** @group globals.counting
  Returns an array of the number of occurrences of \a value[\p i] in
  \a base. The values in \a value need not be distinct.
*/
function array [$X] of var int: distribute(
  array [$X] of var $$E: value,
  array [$Y] of var $$E: base,
)
  :: promise_total =
  let {
    array [int] of var int: value1d = array1d(enum2int(value));
    array [index_set(value1d)] of var 0..length(base): card :: is_defined_var;
    constraint distribute(card, value1d, array1d(enum2int(base))) :: defines_var(card);
  } in arrayXd(value, card);
