/***
!Test
solvers: [gecode]
expected: !Result
  solution: !Solution
***/

var bool: b;
var int: x;
constraint if b then x=1 else x=0 endif;
constraint assert(dom(x)=0..1, "failed to hoist if-then-else");

var set of 1..100: y;
constraint if b then y = 1..3 else y = 4..6 endif;
constraint assert(ub(y) = 1..6, "failed to hoist if-then-else");

var float: z;
constraint if b then z = 1.0 else z = 0.0 endif;
constraint assert(lb(z) = 0.0, "failed to hoist if-then-else");
