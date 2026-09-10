/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

array[2..4] of int: a = [2:2, 3:3, 4:4];
array[2..4] of bool: b = [2:true, 3:false, 4:true];

array[2..4] of tuple(int, bool): z = zip(a, b);
tuple(array[2..4] of int, array[2..4] of bool): u = unzip(z);

constraint assert(z[2] = (2, true) /\ z[3] = (3, false) /\ z[4] = (4, true), "Error");
constraint assert(u.1 = a /\ u.2 = b, "Error");
constraint assert(index_set(z) = index_set(a), "Error");

output ["OK"];
