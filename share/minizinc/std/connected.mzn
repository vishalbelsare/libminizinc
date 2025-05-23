include "fzn_connected.mzn";
include "fzn_connected_reif.mzn";
include "fzn_dconnected.mzn";
include "fzn_dconnected_reif.mzn";

/** @group globals.graph
   Constrains the subgraph \a ns and \a es of a given directed graph to be connected.

   @param from: the leaving node for each edge
   @param to: the entering node for each edge
   @param ns: a Boolean for each node whether it is in the subgraph
   @param es: a Boolean for each edge whether it is in the subgraph
*/
predicate dconnected(
  array [$$E] of $$N: from,
  array [$$E] of $$N: to,
  array [$$N] of var bool: ns,
  array [$$E] of var bool: es,
) =
  assert(
    index_set(from) = index_set(to),
    "dconnected: index set of from and to must be identical",
  ) /\
    assert(
      index_set(from) = index_set(es),
      "dconnected: index set of from and es must be identical",
    ) /\
    assert(
      dom_array(from) subset index_set(ns),
      "dconnected: nodes in from must be in index set of ns",
    ) /\
    assert(
      dom_array(to) subset index_set(ns),
      "dconnected: nodes in to must be in index set of ns",
    ) /\
    fzn_dconnected(index2int(enum2int(from)), index2int(enum2int(to)), index2int(ns), index2int(es));

%-----------------------------------------------------------------------------%

/** @group globals.graph
   Constrains the subgraph \a ns and \a es of a given undirected graph to be connected.

   @param from: is the leaving node for each edge
   @param to: is the entering node for each edge
   @param ns: is a Boolean for each node whether it is in the subgraph
   @param es: is a Boolean for each edge whether it is in the subgraph
*/
predicate connected(
  array [$$E] of $$N: from,
  array [$$E] of $$N: to,
  array [$$N] of var bool: ns,
  array [$$E] of var bool: es,
) =
  assert(
    index_set(from) = index_set(to),
    "connected: index set of from and to must be identical",
  ) /\
    assert(
      index_set(from) = index_set(es),
      "connected: index set of from and es must be identical",
    ) /\
    assert(
      dom_array(from) subset index_set(ns),
      "connected: nodes in from must be in index set of ns",
    ) /\
    assert(
      dom_array(to) subset index_set(ns),
      "connected: nodes in to must be in index set of ns",
    ) /\
    fzn_connected(index2int(enum2int(from)), index2int(enum2int(to)), index2int(ns), index2int(es));
