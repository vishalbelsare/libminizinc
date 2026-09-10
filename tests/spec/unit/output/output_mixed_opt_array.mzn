array [1..2] of var opt 1..3: x ::output = [
    if p=1
    then let { var 1..3: r } in r 
    else <>
    endif
  | p in 1..2];
