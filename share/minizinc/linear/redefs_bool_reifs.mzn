/*
% FlatZinc built-in redefinitions for linear solvers.
%
% AUTHORS
% Sebastian Brand
% Gleb Belov
*/

%-----------------------------------------------------------------------------%
%
% Logic operations
% Use indicators for reifs (CPLEX)?  Seems weak.
%
%-----------------------------------------------------------------------------%

predicate bool_not(var bool: p) = bool2int(p) = 0;

predicate bool_not(var bool: p, var bool: q) = bool2int(p) + bool2int(q) = 1;

predicate bool_and(var bool: p, var bool: q, var bool: r) =
  %  my_trace("  bool_and: \(p) /\\ \(q) <-> \(r) \n") /\
  if false then
    int_lin_le_reif__IND([-1, -1], [p, q], -2, r)
  else
    array_bool_and([p, q], r)
    %    bool_and__INT(bool2int(p), bool2int(q), bool2int(r))
  endif;

predicate bool_and__INT(var int: x, var int: y, var int: z) =
  x + y <= z + 1 /\
    %% x + y >= z * 2;         % weak
    x >= z /\
    y >= z; % strong

predicate bool_or(var bool: p, var bool: q, var bool: r) =
  if false then
    int_lin_le_reif__IND([-1, -1], [p, q], -1, r)
  elseif true then
    array_bool_or([p, q], r)
  else
    let {
      var int: x = bool2int(p);
      var int: y = bool2int(q);
      var int: z = bool2int(r);
    } in x + y >= z /\
      % x + y <= z * 2;       % weak
      x <= z /\
      y <= z % strong
  endif;

predicate bool_xor(var bool: p, var bool: q) = 1 == p + q;

predicate bool_xor(var bool: p, var bool: q, var bool: r) =
  if false then
    %      int_lin_eq_reif__IND( [1, 1], [p, q], 1, r) /\
    true
  else
    let {
      var int: x = bool2int(p);
      var int: y = bool2int(q);
      var int: z = bool2int(r);
    } in x <= y + z /\ y <= x + z /\ z <= x + y /\ x + y + z <= 2
  endif;

predicate bool_eq_reif(var bool: p, var bool: q, var bool: r) =
  %%    trace(" bool_eq_reif: \(p), \(q), \(r) \n") /\
  if is_fixed(r) then % frequent case
    if fix(r) = true then p = q else bool_not(p, q) endif
  elseif is_fixed(q) then
    if fix(q) = true then p = r else bool_not(p, r) endif
  elseif is_fixed(p) then
    if fix(p) = true then q = r else bool_not(q, r) endif
  elseif false then
    %      int_lin_eq_reif__IND( [1, -1], [p, q], 0, r) /\
    true
  else
    let {
      var int: x = bool2int(p);
      var int: y = bool2int(q);
      var int: z = bool2int(r);
    } in x + y <= z + 1 /\ x + z <= y + 1 /\ y + z <= x + 1 /\ x + y + z >= 1
  endif;

predicate bool_ne_reif(var bool: p, var bool: q, var bool: r) = bool_xor(p, q, r);

predicate bool_le(var bool: p :: promise_ctx_antitone, var bool: q :: promise_ctx_monotone) =
  let {
    var int: x :: promise_ctx_antitone = bool2int(p);
    var int: y :: promise_ctx_monotone = bool2int(q);
  } in x <= y;

predicate bool_le_reif(var bool: p, var bool: q, var bool: r) =
  if false then
    %      int_lin_le_reif__IND( [1, -1], [p, q], 0, r) /\
    true
  else
    let {
      var int: x = bool2int(p);
      var int: y = bool2int(q);
      var int: z = bool2int(r);
    } in 1 - x + y >= z /\
      %% /\ 1 - x + y <= z * 2      not needed
      1 - x <= z /\
      y <= z % strong
  endif;

predicate bool_lt(var bool: p :: promise_ctx_antitone, var bool: q :: promise_ctx_monotone) =
  not p /\ q;

predicate bool_lt_reif(var bool: p, var bool: q, var bool: r) = (not p /\ q) <-> r;

%-----------------------------------------------------------------------------%

%% Reified disjunction
predicate array_bool_or(array [int] of var bool: a, var bool: b) =
  if exists (i in index_set(a)) (is_fixed(a[i]) /\ fix(a[i])) then
    b
  elseif is_fixed(b) then % frequent case
    if fix(b) = true then
      sum (i in index_set(a)) (bool2int(a[i])) >= 1 %% >=1 seems better for MIPDomains... 5.4.19
    else
      forall (i in index_set(a)) (not a[i])
    endif
  else
    let {
      var int: x = bool2int(b);
      array [1..length(a)] of var int: c = [bool2int(a[i]) | i in index_set(a)];
    } in sum(c) >= x /\
      %  sum(c) <= x * length(a)                     % weak
      forall (i in index_set(a)) (x >= c[i]) % strong
  endif;

%% Reified conjunction
predicate array_bool_and(array [int] of var bool: a, var bool: b) =
  if exists (i in index_set(a)) (is_fixed(a[i]) /\ not fix(a[i])) then
    not b
  elseif is_fixed(b) then % frequent case
    if fix(b) = false then
      sum (i in index_set(a)) (bool2int(a[i])) <= length(a) - 1
    else
      forall (i in index_set(a)) (a[i])
    endif
  else
    let {
      var int: x = bool2int(b);
      array [1..length(a)] of var int: c = [bool2int(a[i]) | i in index_set(a)];
    } in length(a) - sum(c) >= 1 - x /\
      % length(a) - sum(c) <= (1 - x) * length(a);     % weak
      forall (i in index_set(a)) (x <= c[i]) % strong
  endif;

% predicate array_bool_xor(array[int] of var bool: a) = .. sum(a) is odd ..
predicate array_bool_xor(
  array [int] of var bool: a,
) =
  let {
    var 0..(length(a) - 1) div 2: m;
    var 1..((length(a) - 1) div 2) * 2 + 1: ss = sum (i in index_set(a)) (bool2int(a[i]));
  } in ss == 1 + 2 * m;

predicate bool_clause(
  array [int] of var bool: p :: promise_ctx_monotone,
  array [int] of var bool: n :: promise_ctx_antitone,
) =
  sum (i in index_set(p)) (bool2int(p[i])) -
    sum (i in index_set(n)) (bool2int(n[i])) +
     length(n) >=
    1;

predicate bool_lin_eq(array [int] of int: c, array [int] of var bool: x, var int: d)
  :: promise_total = sum (i in index_set(x)) (c[i] * bool2int(x[i])) == d;

predicate bool_lin_eq_reif(
  array [int] of int: c,
  array [int] of var bool: x,
  int: d,
  var bool: b, %% No var int d, sorry
) = aux_int_eq_iff_1(sum (i in index_set(x)) (c[i] * bool2int(x[i])), d, bool2int(b));
