% Test for indexed comprehension resulting in an array of arrays

any: x ::output = [ (i,j): [i,j] | i in 1..2, j in 1..2 ];
any: y ::output = [ i: [i,i] | i in 1..2 ];
