/***
!Test
solvers: [gecode]
expected: !Error
  regex: '.*Abort: anonymous assignment evaluated*'
***/

any: x = [ i | i in 1..3, _ = abort("anonymous assignment evaluated") ];
