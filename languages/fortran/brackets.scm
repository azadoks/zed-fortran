("(" @open ")" @close)
("[" @open "]" @close)
("(/" @open "/)" @close)
(string_literal "\"" @open "\"" @close)

; Block keywords pair with the `end` of their end statement (`end` or the fused
; `endsubroutine` form), for matching-`end` highlighting and rainbow colors.
(program
  (program_statement "program" @open)
  (end_program_statement ["end" "endprogram"] @close))

(module
  (module_statement "module" @open)
  (end_module_statement ["end" "endmodule"] @close))

(submodule
  (submodule_statement "submodule" @open)
  (end_submodule_statement ["end" "endsubmodule"] @close))

(subroutine
  (subroutine_statement "subroutine" @open)
  (end_subroutine_statement ["end" "endsubroutine"] @close))

(function
  (function_statement "function" @open)
  (end_function_statement ["end" "endfunction"] @close))

(module_procedure
  (module_procedure_statement "module" @open)
  (end_module_procedure_statement ["end" "endprocedure"] @close))

(interface
  (interface_statement "interface" @open)
  (end_interface_statement ["end" "endinterface"] @close))

(derived_type_definition
  (derived_type_statement "type" @open)
  (end_type_statement ["end" "endtype"] @close))

(enum
  (enum_statement "enum" @open)
  (end_enum_statement ["end" "endenum"] @close))

(do_loop
  (do_statement "do" @open)
  (end_do_loop_statement ["end" "enddo"] @close))

(if_statement
  "if" @open
  (end_if_statement ["end" "endif"] @close))

(select_case_statement
  "select" @open
  (end_select_statement ["end" "endselect"] @close))

(select_type_statement
  "select" @open
  (end_select_statement ["end" "endselect"] @close))

(select_rank_statement
  "select" @open
  (end_select_statement ["end" "endselect"] @close))

(associate_statement
  "associate" @open
  (end_associate_statement ["end" "endassociate"] @close))

(block_construct
  "block" @open
  (end_block_construct_statement ["end" "endblock"] @close))

(where_statement
  "where" @open
  (end_where_statement ["end" "endwhere"] @close))

(forall_statement
  "forall" @open
  (end_forall_statement ["end" "endforall"] @close))
