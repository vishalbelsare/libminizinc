/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
    x: 1
***/

% Test for GitHub issue #966 where type-specialise was not setting the type
% of the specialised parameter type-inst correctly.

function $T: foo(array [int] of $T: x) = x[1];
enum Foo = {A};
any: x :: output = foo([A: 1]);
