% Test for GitHub issue #988 where solutions with empty sets caused a crash in the Gecode presolver interface.
var set of 1..0 : x;
output ["x = \(x)"];
