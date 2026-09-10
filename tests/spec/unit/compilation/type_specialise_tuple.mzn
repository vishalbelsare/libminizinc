/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

function array [int] of tuple(any $T, any $U): foo(array [int] of any $T: x, array [int] of any $U: y) =  [(x[i], y[i]) | i in index_set(x)];
array[int] of int: a = [2, 3, 4];
array[int] of bool: b = [true, false, true];
array[int] of tuple(int, bool): z = foo(a, b);
