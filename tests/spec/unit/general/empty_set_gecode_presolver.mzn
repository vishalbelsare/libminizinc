/***
!Test
solvers: [gecode]
extra_files: [empty_set_gecode_presolver.mzc.mzn]
expected:
- !Result
  solution: !Solution
    _checker: >
      x = {}
***/

% Actual test in checker file
solve satisfy;
