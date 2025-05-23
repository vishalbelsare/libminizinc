include "fzn_wst.mzn";
include "fzn_wst_reif.mzn";
include "fzn_dwst.mzn";
include "fzn_dwst_reif.mzn";

/** @group globals.graph
    Constrains the set of edges \a es of a given directed graph to be a weighted spanning tree rooted at \a r of weight \a W.

    @param from: the leaving node for each edge
    @param to: the entering node each edge
    @param w: the weight of each edge
    @param r: the root node (which may be variable)
    @param es: a Boolean for each edge whether it is in the subgraph
    @param K: the weight of the tree
*/
predicate d_weighted_spanning_tree(
  array [$$E] of $$N: from,
  array [$$E] of $$N: to,
  array [$$E] of int: w,
  var $$N: r,
  array [$$E] of var bool: es,
  var int: K,
) =
  let {
    constraint
      assert(
        index_sets_agree(from, to) /\ index_sets_agree(from, w) /\ index_sets_agree(from, es),
        "dwst: index sets of from, to, w and es must match",
      );
  } in if length(from) > 0 then
    fzn_dwst(
      enum2int(max(max(from), max(to))),
      length(from),
      array1d(enum2int(from)),
      array1d(enum2int(to)),
      array1d(w),
      enum2int(r),
      array1d(es),
      K,
    )
  endif;

/** @group globals.graph
    Constrains the set of edges \a es of a given directed graph to be a weighted spanning tree rooted at \a r of weight \a W.

    @param N: the number of nodes in the given graph
    @param E: the number of edges in the given graph
    @param from: the leaving node 1..\a N for each edge
    @param to: the entering node 1..\a N for each edge
    @param w: the weight of each edge
    @param r: the root node (which may be variable)
    @param es: a Boolean for each edge whether it is in the subgraph
    @param K: the weight of the tree
*/
predicate d_weighted_spanning_tree(
  int: N,
  int: E,
  array [int] of int: from,
  array [int] of int: to,
  array [int] of int: w,
  var int: r,
  array [int] of var bool: es,
  var int: K,
) =
  assert(index_set(from) = 1..E, "dwst: index set of from must be 1..\(E)") /\
    assert(index_set(to) = 1..E, "dwst: index set of to must be 1..\(E)") /\
    assert(index_set(es) = 1..E, "dwst: index set of es must be 1..\(E)") /\
    assert(index_set(w) = 1..E, "dwst: index set of w must be 1..\(E)") /\
    fzn_dwst(N, E, from, to, w, r, es, K);

/** @group globals.graph
    Constrains the set of edges \a es of a given undirected graph to be a weighted spanning tree of weight \a W.

    @param N: the number of nodes in the given graph
    @param E: the number of edges in the given graph
    @param from: the leaving node 1..\a N for each edge
    @param to: the entering node 1..\a N for each edge
    @param w: the weight of each edge
    @param es: a Boolean for each edge whether it is in the subgraph
    @param K: the weight of the tree
*/
predicate weighted_spanning_tree(
  array [$$E] of int: from,
  array [$$E] of int: to,
  array [$$E] of int: w,
  array [$$E] of var bool: es,
  var int: K,
) =
  let {
    constraint
      assert(
        index_sets_agree(from, to) /\ index_sets_agree(from, w) /\ index_sets_agree(from, es),
        "wst: index sets of from, to, w and es must match",
      );
  } in if length(from) > 0 then
    fzn_wst(
      enum2int(max(max(from), max(to))),
      length(from),
      array1d(enum2int(from)),
      array1d(enum2int(to)),
      array1d(w),
      array1d(es),
      K,
    )
  endif;

%-----------------------------------------------------------------------------%

/** @group globals.graph
    Constrains the set of edges \a es of a given undirected graph to be a weighted spanning tree of weight \a W.

    @param N: the number of nodes in the given graph
    @param E: the number of edges in the given graph
    @param from: the leaving node 1..\a N for each edge
    @param to: the entering node 1..\a N for each edge
    @param w: the weight of each edge
    @param es: a Boolean for each edge whether it is in the subgraph
    @param K: the weight of the tree
*/
predicate weighted_spanning_tree(
  int: N,
  int: E,
  array [int] of int: from,
  array [int] of int: to,
  array [int] of int: w,
  array [int] of var bool: es,
  var int: K,
) =
  assert(index_set(from) = 1..E, "wst: index set of from must be 1..\(E)") /\
    assert(index_set(to) = 1..E, "wst: index set of to must be 1..\(E)") /\
    assert(index_set(es) = 1..E, "wst: index set of es must be 1..\(E)") /\
    assert(index_set(w) = 1..E, "wst: index set of w must be 1..\(E)") /\
    fzn_wst(N, E, from, to, w, es, K);

%-----------------------------------------------------------------------------%
