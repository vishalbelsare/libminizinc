include "fzn_subgraph_int.mzn";
include "fzn_subgraph_int_reif.mzn";
include "fzn_subgraph_enum.mzn";
include "fzn_subgraph_enum_reif.mzn";

/** @group globals.graph
    Constrains that \a ns and \a es is a subgraph of a given directed graph.

    @param N: the number of nodes in the given graph
    @param E: the number of edges in the given graph
    @param from: the leaving node 1..\a N for each edge
    @param to: the entering node 1..\a N for each edge
    @param ns: a Boolean for each node whether it is in the subgraph
    @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate subgraph(
  int: N,
  int: E,
  array [int] of int: from,
  array [int] of int: to,
  array [int] of var bool: ns,
  array [int] of var bool: es,
) =
  assert(index_set(from) = 1..E, "subgraph: index set of from must be 1..\(E)") /\
    assert(index_set(to) = 1..E, "subgraph: index set of to must be 1..\(E)") /\
    assert(index_set(ns) = 1..N, "subgraph: index set of ns must be 1..\(N)") /\
    assert(index_set(es) = 1..E, "subgraph: index set of es must be 1..\(E)") /\
    fzn_subgraph(N, E, from, to, ns, es);

/** @group globals.graph
    Constrains that \a ns and \a es is a subgraph of a given directed graph.

    @param from: the leaving node for each edge
    @param to: the entering node for each edge
    @param ns: a Boolean for each node whether it is in the subgraph
    @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate subgraph(
  array [$$E] of $$N: from,
  array [$$E] of $$N: to,
  array [$$N] of var bool: ns,
  array [$$E] of var bool: es,
) =
  assert(
    index_set(from) = index_set(to),
    "subgraph: index set of from and to must be identical",
  ) /\
    assert(
      index_set(from) = index_set(es),
      "subgraph: index set of from and es must be identical",
    ) /\
    assert(
      dom_array(from) subset index_set(ns),
      "subgraph: elements in from must be in index set of ns",
    ) /\
    assert(
      dom_array(to) subset index_set(ns),
      "subgraph: elements in to must be in index set of ns",
    ) /\
    fzn_subgraph(index2int(enum2int(from)), index2int(enum2int(to)), index2int(ns), index2int(es));

%-----------------------------------------------------------------------------%
