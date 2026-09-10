/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
    z1: [[[1, 3], [1, 3], [1, 3]], [[1, 3], [1, 3], [1, 3]], [[1, 3], [1, 3], [1, 3]]]
    z2: [[2, 2, 2], [2, 2, 2], [2, 2, 2]]
    z3: [[3, 3, 3], [3, 3, 3], [3, 3, 3]]
    z4: [[0, 1], [0, 1], [0, 1]]
    z5: [2, 2, 2]
***/

enum E = {A, B, C};
array[E,E] of tuple(tuple(var 1..2, var 3..4), var 2..3): x;
array[E] of record(tuple(var 0..1, var 1..2): a, record(var 2..3: c): b): y;
array[E,E] of tuple(var int, var int): z1 ::output = x.1;
array[E,E] of var int: z2 ::output = x.2;
any: z3::output = (x.1).2;
any: z4::output = y.a;
any: z5::output = y.b.c;

solve minimize sum(x_i in x)(x_i.1.1 + x_i.1.2 + x_i.2) + sum(y_i in y)(y_i.a.1 + y_i.a.2 + y_i.b.c);
