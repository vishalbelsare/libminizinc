/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
    x: !!set {1}
***/

enum Foo = {A};
enum Bar = {B};
set of int: x :: output = enum2int(Foo) union enum2int(Bar);
