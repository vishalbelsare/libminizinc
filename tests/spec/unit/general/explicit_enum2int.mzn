/***
!Test
solvers: [chuffed]
options:
  -Werror: true
expected: !Result
  solution: !Solution
    var_foo: A
    var_opt_foo: A
    var_set_foo: !!set {A}
    e2i_foo: 1
    e2i_var_foo: 1
    e2i_opt_foo: 1
    e2i_var_opt_foo: 1
    e2i_opt_set_foo: !!set {1}
    e2i_set_foo: !!set {1}
    e2i_var_set_foo: !!set {1}
    e2i_foo_array: [1]
    e2i_var_foo_array: [1]
    e2i_opt_foo_array: [1]
    e2i_var_opt_foo_array: [1]
    e2i_opt_set_foo_array: [!!set {1}]
    e2i_set_foo_array: [!!set {1}]
    e2i_var_set_foo_array: [!!set {1}]
    i2i_array_foo_int: [1]
    i2i_array_foo_foo_int: [[1]]
***/

enum Foo = {A};

var Foo: var_foo;

opt Foo: opt_foo = A;
var opt Foo: var_opt_foo;
constraint occurs(var_opt_foo);

opt set of Foo: opt_set_foo = Foo;
var set of Foo: var_set_foo;
constraint card(var_set_foo) > 0;

array [Foo] of int: array_foo_int = [A: 1];
array [Foo, Foo] of int: array_foo_foo_int = [(A, A): 1];

int: e2i_foo :: output = enum2int(A);
var int: e2i_var_foo :: output = enum2int(var_foo);

opt int: e2i_opt_foo :: output = enum2int(opt_foo);
var opt int: e2i_var_opt_foo :: output = enum2int(var_opt_foo);

opt set of int: e2i_opt_set_foo :: output = enum2int(opt_set_foo);
set of int: e2i_set_foo :: output = enum2int(Foo);
var set of int: e2i_var_set_foo :: output = enum2int(var_set_foo);

array [int] of int: e2i_foo_array :: output = enum2int([A]);
array [int] of var int: e2i_var_foo_array :: output = enum2int([var_foo]);

array [int] of opt int: e2i_opt_foo_array :: output = enum2int([opt_foo]);
array [int] of var opt int: e2i_var_opt_foo_array :: output = enum2int([var_opt_foo]);

array [int] of opt set of int: e2i_opt_set_foo_array :: output = enum2int([opt_set_foo]);
array [int] of set of int: e2i_set_foo_array :: output = enum2int([Foo]);
array [int] of var set of int: e2i_var_set_foo_array :: output = enum2int([var_set_foo]);

array [int] of int: i2i_array_foo_int :: output = index2int(array_foo_int);
array [int, int] of int: i2i_array_foo_foo_int :: output = index2int(array_foo_foo_int);
