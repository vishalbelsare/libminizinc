/***
!Test
extra_files:
- json_enum_def_2.json
solvers: [gecode]
expected: !Result
  solution: !Solution
    x: ["C(1)", "C(2)", "C(3)", "A", "B", "to_enum(Foo,6)", "to_enum(Foo,7)", "to_enum(Foo,8)"]
***/

enum Foo;

any: x :: output = [show(i) | i in Foo];
