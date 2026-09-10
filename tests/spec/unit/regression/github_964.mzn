/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
    b: true
***/

include "globals.mzn";
var bool: b :: output = nvalue(1, [1]);
