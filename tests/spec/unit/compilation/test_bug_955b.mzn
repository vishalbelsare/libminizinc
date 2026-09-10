/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

var int: aa;
array[int] of record(var int: a, int: b): TEST = [(a: aa, b: 2), (a: 2, b: 2)];

constraint (a: 1, b: 2) in TEST;
