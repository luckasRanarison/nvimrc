local M = {}

--- call VSCodeNotify shorthand
--- @param cmd string vscode command
--- @return string
M.cmd = function(cmd)
  return "<cmd>call VSCodeNotify('" .. cmd .. "')<cr>"
end

return M
