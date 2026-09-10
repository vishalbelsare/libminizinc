/***
!Test
solvers: [gecode]
options:
  all_solutions: true
expected: !Result
  status: ALL_SOLUTIONS
  solution: !SolutionSet
  - !Solution
    x : [1, 1]
    y : 4
  - !Solution
    x : [2, 1]
    y : 3
  - !Solution
    x : [1, 2]
    y : 3
  - !Solution
    x : [2, 2]
    y : 2
***/

array[1..2] of int: a = [2,1];
array[1..2] of 1..3: b = [1,2];
array[1..2] of var 1..2: x;
function var int: f(int: t) = a[b[x[t]]];
var int: y ::output = sum(t in 1..2) (f(t));
