/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

enum E = {A};
array [int] of tuple(array [int] of opt E): x = [ ([A],), ([A, <>],)];
