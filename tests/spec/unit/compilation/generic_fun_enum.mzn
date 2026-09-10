
/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

enum E = {A,B};
function array[$X] of E: f(array[$X] of E: x) = x;
array[1..2,1..2] of E: x = [|A,B|A,B|];
any: y = f(x);
