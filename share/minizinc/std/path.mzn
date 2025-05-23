include "fzn_path_int.mzn";
include "fzn_path_int_reif.mzn";
include "fzn_path_enum.mzn";
include "fzn_path_enum_reif.mzn";
include "fzn_dpath_int.mzn";
include "fzn_dpath_int_reif.mzn";
include "fzn_dpath_enum.mzn";
include "fzn_dpath_enum_reif.mzn";

/** @group globals.graph
   Constrains the subgraph \a ns and \a es of a given directed graph to be a path from \a s to \a t.

   @param N: the number of nodes in the given graph
   @param E: the number of edges in the given graph
   @param from: the leaving node 1..\a N for each edge
   @param to: the entering node 1..\a N for each edge
   @param s: the source node (which may be variable)
   @param t: the dest node (which may be variable)
   @param ns: a Boolean for each node whether it is in the subgraph
   @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate dpath(
  int: N,
  int: E,
  array [int] of int: from,
  array [int] of int: to,
  var int: s,
  var int: t,
  array [int] of var bool: ns,
  array [int] of var bool: es,
) =
  assert(index_set(from) = 1..E, "dpath: index set of from must be 1..\(E)") /\
    assert(index_set(to) = 1..E, "dpath: index set of to must be 1..\(E)") /\
    assert(index_set(ns) = 1..N, "dpath: index set of ns must be 1..\(N)") /\
    assert(index_set(es) = 1..E, "dpath: index set of es must be 1..\(E)") /\
    fzn_dpath(N, E, from, to, s, t, ns, es);

/** @group globals.graph
   Constrains the subgraph \a ns and \a es of a given directed graph to be a path from \a s to \a t.

   @param from: the leaving node for each edge
   @param to: the entering node for each edge
   @param s: the source node (which may be variable)
   @param t: the dest node (which may be variable)
   @param ns: a Boolean for each node whether it is in the subgraph
   @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate dpath(
  array [int] of $$N: from,
  array [int] of $$N: to,
  var $$N: s,
  var $$N: t,
  array [$$N] of var bool: ns,
  array [int] of var bool: es,
) =
  assert(index_set(from) = index_set(to), "dpath: index set of from and to must be identical") /\
    assert(index_set(from) = index_set(es), "dpath: index set of from and es must be identical") /\
    assert(
      dom_array(from) subset index_set(ns),
      "dpath: nodes in from must be in index set of ns",
    ) /\
    assert(dom_array(to) subset index_set(ns), "dpath: nodes in to must be in index set of ns") /\
    fzn_dpath(enum2int(from), enum2int(to), enum2int(s), enum2int(t), index2int(ns), es);

%-----------------------------------------------------------------------------%

/** @group globals.graph
   Constrains the subgraph \a ns and \a es of a given undirected graph to be a path from \a s to \a t.

   @param N: the number of nodes in the given graph
   @param E: the number of edges in the given graph
   @param from: the leaving node 1..\a N for each edge
   @param to: the entering node 1..\a N for each edge
   @param s: the source node (which may be variable)
   @param t: the dest node (which may be variable)
   @param ns: a Boolean for each node whether it is in the subgraph
   @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate path(
  int: N,
  int: E,
  array [int] of int: from,
  array [int] of int: to,
  var int: s,
  var int: t,
  array [int] of var bool: ns,
  array [int] of var bool: es,
) =
  assert(index_set(from) = 1..E, "path: index set of from must be 1..\(E)") /\
    assert(index_set(to) = 1..E, "path: index set of to must be 1..\(E)") /\
    assert(index_set(ns) = 1..N, "path: index set of ns must be 1..\(N)") /\
    assert(index_set(es) = 1..E, "path: index set of es must be 1..\(E)") /\
    fzn_path(N, E, from, to, s, t, ns, es);

/** @group globals.graph
   Constrains the subgraph \a ns and \a es of a given undirected graph to be a path from \a s to \a t.

   @param from: the leaving node for each edge
   @param to: the entering node for each edge
   @param s: the source node (which may be variable)
   @param t: the dest node (which may be variable)
   @param ns: a Boolean for each node whether it is in the subgraph
   @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate path(
  array [int] of $$N: from,
  array [int] of $$N: to,
  var $$N: s,
  var $$N: t,
  array [$$N] of var bool: ns,
  array [int] of var bool: es,
) =
  assert(index_set(from) = index_set(to), "path: index set of from and to must be identical") /\
    assert(index_set(from) = index_set(es), "path: index set of from and es must be identical") /\
    assert(
      dom_array(from) subset index_set(ns),
      "path: nodes in from must be in index set of ns",
    ) /\
    assert(dom_array(to) subset index_set(ns), "path: nodes in to must be in index set of ns") /\
    fzn_path(enum2int(from), enum2int(to), enum2int(s), enum2int(t), index2int(ns), es);
