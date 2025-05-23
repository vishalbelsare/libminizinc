/***
  @groupdef globals.alldifferent All-Different and related constraints

  @groupdef globals.lexicographic Lexicographic constraints
  
  @groupdef globals.sort Sorting constraints
  
  @groupdef globals.channeling Channeling constraints
  
  @groupdef globals.counting Counting constraints
  
  These constraints count and restrict how many times certain values occur
  in an array of variables. MiniZinc will automatically generate the basic counting
  constraints below from expressions such as \[count(i in x)(i=c) <= d\], so you
  can write models in this much more readable style instead of using these
  predicates. However, if your model
  contains multiple counting constraints over the same array, constraints
  like \[distribute\] or \[global_cardinality\] below may be useful.
  
  @groupdef globals.array Array-related constraints

  @groupdef globals.set Set-related constraints

  @groupdef globals.math Mathematical constraints

  @groupdef globals.packing Packing constraints
  
  @groupdef globals.scheduling Scheduling constraints
  
  @groupdef globals.graph Graph constraints
  
  Many of these constraints operate on graphs that are represented as lists of edges.
  The constraints take a given (fixed) graph as arguments, which is represented
  using two arrays, \[from\] and \[to\], representing the graph with edges
  \[(from[i],to[i])\], where \[from[i]\] and \[to[i]\] are nodes of the graph.

  @groupdef globals.extensional Extensional constraints (table, regular etc.)

  @groupdef globals.learning Machine learning constraints

  @groupdef globals.deprecated Deprecated constraints

*/

include "all_different.mzn";
include "all_different_except.mzn";
include "all_different_except_0.mzn";
include "all_disjoint.mzn";
include "all_equal.mzn";
include "alternative.mzn";
include "among.mzn";
include "among_fn.mzn";
include "arg_sort.mzn";
include "arg_min.mzn";
include "arg_max.mzn";
include "arg_val.mzn";
include "at_least.mzn";
include "at_most.mzn";
include "at_most1.mzn";
include "bin_packing.mzn";
include "bin_packing_capa.mzn";
include "bin_packing_load.mzn";
include "bin_packing_load_fn.mzn";
include "bounded_path.mzn";
include "circuit.mzn";
include "circuit_opt.mzn";
include "connected.mzn";
include "cost_mdd.mzn";
include "cost_regular.mzn";
include "count.mzn";
include "count_fn.mzn";
include "cumulative.mzn";
include "cumulative_opt.mzn";
include "cumulatives.mzn";
include "dag.mzn";
include "decreasing.mzn";
include "diffn.mzn";
include "diffn_nonstrict.mzn";
include "diffn_k.mzn";
include "diffn_nonstrict_k.mzn";
include "disjoint.mzn";
include "disjunctive.mzn";
include "disjunctive_strict.mzn";
include "disjunctive_opt.mzn";
include "disjunctive_strict_opt.mzn";
include "distribute.mzn";
include "distribute_fn.mzn";
include "element.mzn";
include "exactly.mzn";
include "geost.mzn";
include "global_cardinality.mzn";
include "global_cardinality_fn.mzn";
include "global_cardinality_closed.mzn";
include "global_cardinality_closed_fn.mzn";
include "global_cardinality_low_up.mzn";
include "global_cardinality_low_up_closed.mzn";
include "increasing.mzn";
include "int_set_channel.mzn";
include "inverse.mzn";
include "inverse_fn.mzn";
include "inverse_in_range.mzn";
include "inverse_set.mzn";
include "knapsack.mzn";
include "lex_greatereq.mzn";
include "lex_greater.mzn";
include "lex_lesseq.mzn";
include "lex_less.mzn";
include "lex_chain_lesseq.mzn";
include "lex_chain_greatereq.mzn";
include "lex_chain_lesseq_orbitope.mzn";
include "lex_chain_greatereq_orbitope.mzn";
include "lex_chain_less.mzn";
include "lex_chain_greater.mzn";
include "lex2.mzn";
include "lex2_strict.mzn";
include "link_set_to_booleans.mzn";
include "maximum.mzn";
include "mdd.mzn";
include "mdd_nondet.mzn";
include "member.mzn";
include "minimum.mzn";
include "network_flow.mzn";
include "neural_net.mzn";
include "nvalue.mzn";
include "nvalue_fn.mzn";
include "partition_set.mzn";
include "piecewise_linear.mzn";
include "piecewise_linear_non_continuous.mzn";
include "range.mzn";
include "range_fn.mzn";
include "reachable.mzn";
include "regular.mzn";
include "regular_nfa.mzn";
include "regular_regexp.mzn";
include "roots.mzn";
include "roots_fn.mzn";
include "seq_precede_chain.mzn";
include "sliding_sum.mzn";
include "sort.mzn";
include "sort_fn.mzn";
include "span.mzn";
include "steiner.mzn";
include "strictly_decreasing.mzn";
include "strictly_increasing.mzn";
include "strict_lex2.mzn";
include "subcircuit.mzn";
include "subgraph.mzn";
include "sum_pred.mzn";
include "sum_set.mzn";
include "symmetric_all_different.mzn";
include "table.mzn";
include "tree.mzn";
include "value_precede.mzn";
include "value_precede_chain.mzn";
include "var_sqr_sym.mzn";
include "var_perm_sym.mzn";
include "weighted_spanning_tree.mzn";
include "write.mzn";
include "writes.mzn";
include "writes_seq.mzn";
