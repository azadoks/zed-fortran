; Based on the queries shipped with stadelmanma/tree-sitter-fortran, with capture
; names that Zed themes style. Later patterns take precedence over earlier ones.

[
 (identifier)
 (module_name)
 (local_name)
 (variable_group (name))
] @variable

(string_literal) @string
(number_literal) @number
(statement_label) @number
(statement_label_reference) @number
(boolean_literal) @boolean
(comment) @comment

; FORD / Doxygen documentation comments: `!!`, `!>`, `!<`
((comment) @comment.doc
  (#match? @comment.doc "^!(!|>|<)"))

; OpenMP / OpenACC / compiler directives: `!$omp`, `!$acc`, `!dir$`, ...
((comment) @preproc
  (#match? @preproc "^!(\\$[a-zA-Z]|[a-zA-Z]+\\$)"))

[
 (custom_directive)
 (preproc_include)
 (preproc_def)
 (preproc_function_def)
 (preproc_call)
] @preproc

[
 "#define"
 "#elif"
 "#elifdef"
 "#elifndef"
 "#else"
 "#endif"
 "#if"
 "#ifdef"
 "#ifndef"
 "#include"
] @preproc

[
 (derived_type)
 (derived_type_statement)
 (import_statement)
 (intrinsic_type)
 (type_name)
] @type

(intrinsic_type) @type.builtin

(base_type_specifier
  (identifier) @type)

[
 (abstract_specifier)
 (access_specifier)
 (block_label)
 (block_label_start_expression)
 (none)
 (procedure_attributes)
 (procedure_qualifier)
 (type_qualifier)
] @attribute

[
 (base_type_specifier)
 (block_construct)
 (contains_statement)
 (default)
 (end_associate_statement)
 (end_block_construct_statement)
 (end_block_data_statement)
 (end_coarray_critical_statement)
 (end_coarray_team_statement)
 (end_do_loop_statement)
 (end_enum_statement)
 (end_enumeration_type_statement)
 (end_forall_statement)
 (end_function_statement)
 (end_if_statement)
 (end_interface_statement)
 (end_module_procedure_statement)
 (end_module_statement)
 (end_program_statement)
 (end_select_statement)
 (end_submodule_statement)
 (end_subroutine_statement)
 (end_type_statement)
 (end_where_statement)
 (enum_statement)
 (enumeration_type_statement)
 (enumerator_statement)
 (equivalence_statement)
 (function_statement)
 (implicit_statement)
 (interface_statement)
 (keyword_statement)
 (language_binding)
 (module_statement)
 (namelist_statement)
 (print_statement)
 (procedure_statement)
 (program_statement)
 (stop_statement)
 (submodule_statement)
 (subroutine_statement)
] @keyword

(use_statement "use" @keyword)
(use_statement "intrinsic" @keyword)
(included_items "only" @keyword)
(allocate_statement "allocate" @keyword)
(deallocate_statement "deallocate" @keyword)
(subroutine_call "call" @keyword)
(do_statement "do" @keyword)
(while_statement "while" @keyword)
(if_statement ["if" "then"] @keyword)
(elseif_clause ["else" "if" "elseif" "then"] @keyword)
(else_clause "else" @keyword)
(open_statement "open" @keyword)
(write_statement "write" @keyword)
(private_statement "private" @keyword)
(public_statement "public" @keyword)
(data_statement "data" @keyword)

(read_statement "read" @keyword)
(close_statement "close" @keyword)
(inquire_statement "inquire" @keyword)
(format_statement "format" @keyword)
(file_position_statement ["backspace" "flush" "rewind"] @keyword)
(nullify_statement "nullify" @keyword)
(save_statement "save" @keyword)
(parameter_statement "parameter" @keyword)
(common_statement "common" @keyword)
(include_statement "include" @keyword)
(associate_statement "associate" @keyword)
(forall_statement "forall" @keyword)
(where_statement "where" @keyword)
(elsewhere_clause "elsewhere" @keyword)
(concurrent_header "concurrent" @keyword)
(arithmetic_if_statement "if" @keyword)
(procedure "procedure" @keyword)
(generic_statement "generic" @keyword)
(final_statement "final" @keyword)
(operator "operator" @keyword)
(assignment "assignment" @keyword)
(end_do_label_loop_statement ["end" "do"] @keyword)

(select_case_statement "select" @keyword "case" @keyword)
(select_type_statement "select" @keyword "type" @keyword)
(select_rank_statement "select" @keyword "rank" @keyword)
(case_statement "case" @keyword)
(type_statement "type" @keyword)
(rank_statement "rank" @keyword)

[
 "*"
 "**"
 "+"
 "-"
 "/"
 "//"
 "="
 "=>"
 "<"
 ">"
 "<="
 ">="
 "=="
 "/="
 ".and."
 ".or."
 ".not."
 ".lt."
 ".gt."
 ".ge."
 ".le."
 ".eq."
 ".eqv."
 ".neqv."
 ".ne."
 "&&"
 "||"
 "!="
] @operator

[
 "("
 ")"
 "["
 "]"
 "<<<"
 ">>>"
] @punctuation.bracket

[
 "::"
 ","
 "%"
 ":"
] @punctuation.delimiter

[
 "(/"
 "/)"
] @punctuation.bracket

";" @punctuation.delimiter

"&" @punctuation.special

(user_defined_operator) @operator
(operator_name) @operator

(null_literal) @constant.builtin
(edit_descriptor) @string.special
(hollerith_constant) @string
(filename) @string
(preproc_defined "defined" @preproc)

; Keyword-style specifiers in I/O statements: `unit=`, `fmt=`
[
 (unit_identifier "unit" @property)
 (format_identifier "fmt" @property)
]

; CUDA Fortran attributes and procedure binding attributes
[
 (variable_attributes)
 (procedure_attribute)
] @attribute

(procedure_interface) @type

[
 (binding_list (method_name) @function)
 (final_statement (method_name) @function)
]

(parameters
  (identifier) @variable.parameter)

; Program, module and submodule names (namespaces, which themes color like types)
[
 (program_statement (name) @type)
 (module_statement (name) @type)
 (submodule_statement (module_name) (name) @type)
 (end_program_statement (name) @type)
 (end_module_statement (name) @type)
 (end_submodule_statement (name) @type)
]

(function_statement
  (name) @function)

(subroutine_statement
  (name) @function)

(module_procedure_statement
  (name) @function)

(end_function_statement
  (name) @function)

(end_subroutine_statement
  (name) @function)

(end_module_procedure_statement
  (name) @function)

(end_type_statement
  (name) @type)

(subroutine_call
  (identifier) @function)

(keyword_argument
  name: (identifier) @property)

(keyword_statement
  (identifier) @attribute)

(derived_type_member_expression
  (type_member) @property)

; Calls to intrinsic procedures. Other calls look like array indexing to the
; parser, so they keep the variable color.
(call_expression
  .
  (identifier) @function.builtin
  (#match? @function.builtin "(?i)^(abs|achar|acos|acosh|adjustl|adjustr|aimag|aint|all|allocated|anint|any|asin|asinh|associated|atan|atan2|atanh|bit_size|btest|ceiling|char|cmplx|command_argument_count|conjg|cos|cosh|count|cpu_time|cshift|date_and_time|dble|digits|dim|dot_product|dprod|eoshift|epsilon|erf|erfc|exp|exponent|findloc|floor|fraction|gamma|get_command|get_command_argument|get_environment_variable|huge|hypot|iachar|iand|ibclr|ibits|ibset|ichar|ieor|index|int|ior|ishft|ishftc|is_contiguous|kind|lbound|len|len_trim|lge|lgt|lle|llt|log|log10|log_gamma|logical|maskl|maskr|matmul|max|maxloc|maxval|merge|min|minloc|minval|mod|modulo|move_alloc|nearest|new_line|nint|norm2|not|null|pack|popcnt|precision|present|product|radix|random_number|random_seed|range|rank|real|repeat|reshape|scale|scan|selected_char_kind|selected_int_kind|selected_real_kind|shape|sign|sin|sinh|size|spacing|spread|sqrt|storage_size|sum|system_clock|tan|tanh|tiny|trailz|transfer|transpose|trim|ubound|unpack|verify)$"))
