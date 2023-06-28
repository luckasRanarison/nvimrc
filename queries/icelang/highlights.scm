(comment) @comment

(string) @string
(number) @number
(null) @constant
(boolean) @constant

[
  "set"
  "function"
  "lambda"
  "if"
  "else"
  "match"
  "loop"
  "while"
  "for"
  "in"
  "continue"
  "break"
  "return"
] @keyword

[
  "+"
  "-"
  "%"
  "*"
  "/"
  "="
  "!"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "and"
  "or"
  "to"
] @operator

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(expr_identifier) @variable

(stmt_var_decl
  name: (expr_identifier) @function
  value: (expr_lambda)
)

(stmt_func_decl
  name: (expr_identifier) @function
)

(stmt_func_decl
  args: (args
    (expr_identifier) @variable.parameter
  )
)

(expr_lambda
  args: (args
    (expr_identifier) @variable.parameter
  )
)

(expr_call
  func: (expr_identifier) @function.call
)

(expr_field
  field: (expr_identifier) @property
)

(expr_object
  (prop
    name: (expr_identifier) @property
  )
)

(expr_object
  (prop
    name: (expr_identifier) @method
    value: (expr_lambda)
  )
)

(expr_call
  func: (expr_field
    field: (expr_identifier) @method.call
  )
)
