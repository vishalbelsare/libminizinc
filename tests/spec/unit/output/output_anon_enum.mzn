/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
    x: "to_enum(Foo,10)"
***/

enum Foo = C(1..5) ++ _(1..5);
any: x :: output = show(to_enum(Foo, 10));
