%
%  Main authors:
%     Guido Tack <tack@gecode.org>
%
%  Copyright:
%     Guido Tack, 2007
%
%  Last modified:
%     $Date: 2012-03-19 11:56:37 +1100 (Mon, 19 Mar 2012) $ by $Author: tack $
%     $Revision: 12583 $
%
%  This file is part of Gecode, the generic constraint
%  development environment:
%     http://www.gecode.org
%
%  Permission is hereby granted, free of charge, to any person obtaining
%  a copy of this software and associated documentation files (the
%  "Software"), to deal in the Software without restriction, including
%  without limitation the rights to use, copy, modify, merge, publish,
%  distribute, sublicense, and/or sell copies of the Software, and to
%  permit persons to whom the Software is furnished to do so, subject to
%  the following conditions:
%
%  The above copyright notice and this permission notice shall be
%  included in all copies or substantial portions of the Software.
%
%  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
%  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
%  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
%  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
%  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
%  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
%

predicate gecode_int_set_channel(
  array [int] of var int: x,
  int: xoff,
  array [int] of var set of int: y,
  int: yoff,
);

predicate fzn_int_set_channel(array [int] of var int: x, array [int] of var set of int: y) =
  if (min(index_set(x)) < 0 \/ min(index_set(y)) < 0) then
    forall (i in index_set(x)) (x[i] in index_set(y)) /\
      forall (j in index_set(y)) (y[j] subset index_set(x)) /\
      forall (i in index_set(x), j in index_set(y)) (x[i] = j <-> i in y[j])
  else
    gecode_int_set_channel(x, min(index_set(x)), y, min(index_set(y)))
  endif;
