; Zed indents the lines inside an @indent node, up to the line holding @end.
(module (end_module_statement) @end) @indent
(submodule (end_submodule_statement) @end) @indent
(program (end_program_statement) @end) @indent
(subroutine (end_subroutine_statement) @end) @indent
(function (end_function_statement) @end) @indent
(module_procedure (end_module_procedure_statement) @end) @indent
(interface (end_interface_statement) @end) @indent
(derived_type_definition (end_type_statement) @end) @indent
(enum (end_enum_statement) @end) @indent
(do_loop (end_do_loop_statement) @end) @indent
(if_statement (end_if_statement) @end) @indent
(where_statement (end_where_statement) @end) @indent
(forall_statement (end_forall_statement) @end) @indent
(select_case_statement (end_select_statement) @end) @indent
(select_type_statement (end_select_statement) @end) @indent
(select_rank_statement (end_select_statement) @end) @indent
(associate_statement (end_associate_statement) @end) @indent
(block_construct (end_block_construct_statement) @end) @indent

[
  (elseif_clause)
  (else_clause)
  (elsewhere_clause)
  (case_statement)
  (type_statement)
  (rank_statement)
  (internal_procedures)
] @indent

(_ "(" ")" @end) @indent
(_ "[" "]" @end) @indent
