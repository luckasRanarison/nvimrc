[
  (args)
  (stmt_block)  
  (expr_object)
  (expr_array)
  (match_body)
] @indent.begin

(stmt_block "}" @indent.end)
(match_body "}" @indent.end)
(expr_object "}" @indent.end)
(expr_array "]" @indent.end)

[ 
  ")" 
  "}" 
  "]" 
] @indent.branch
