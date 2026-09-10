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
array[E,E] of tuple(tuple(int,int),int): x = [ (e1,e2): ((1,3),2) | e1, e2 in E];
array[E] of record(tuple(int,int): a, record(int:c): b): y = [ e: (a: (0,1), b: (c: 2)) | e in E ];
array[E,E] of tuple(int,int): z1 ::output = x.1;
array[E,E] of int: z2 ::output = x.2;
any: z3::output = (x.1).2;
any: z4::output = y.a;
any: z5::output = y.b.c;
