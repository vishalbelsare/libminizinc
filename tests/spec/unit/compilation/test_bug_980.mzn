/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/
predicate foo(var int: x) = let { var bool: b  = (x = 1)} in b;
array[1..1] of array[1..1] of var bool: dominates = [[foo(s) | s in 1..1] | t in 1..1];
