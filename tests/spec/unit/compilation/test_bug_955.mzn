/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

var int: x;
constraint forall (q in 1..1) ( (x, 1) = (1, 1) );
