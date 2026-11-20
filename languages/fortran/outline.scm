(program
  (program_statement
    "program" @context
    (name) @name)) @item

(module
  (module_statement
    "module" @context
    (name) @name)) @item

(submodule
  (submodule_statement
    "submodule" @context
    (name) @name)) @item

(derived_type_definition
  (derived_type_statement
    "type" @context
    (type_name) @name)) @item

(interface
  (interface_statement
    "interface" @context
    (name) @name)) @item

(function
  (function_statement
    "function" @context
    name: (name) @name)) @item

(subroutine
  (subroutine_statement
    "subroutine" @context
    name: (name) @name)) @item

(module_procedure
  (module_procedure_statement
    "procedure" @context
    name: (name) @name)) @item
