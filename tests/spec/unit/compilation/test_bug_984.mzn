/***
!Test
solvers: [gecode]
options: 
  -O2: true
expected: !Result
  solution: !Solution
***/

type T = tuple(var 0.0..0.0, var 0.0..0.0);
array [1..2] of T: a;

constraint a[1].1 = -a[1].1;
constraint a[1].1 = a[1].2;
constraint a[2].1 = -a[2].1;
