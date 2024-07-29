local M = {}

local U = require "utils.lib"

local mappings = U.tbl_double_lookup({
  { "let", "let" },
  { "true", "false" },
  { "True", "False" },
  { "~=", "==" },
  { "==", "!=" },
  { "===", "!==" },
  { ">", "<=" },
  { ">=", "<" },
})

M.switch = function()
  vim.opt.iskeyword:append({ "=", "!", "<", ">", "~" })
  local word = vim.fn.expand "<cword>"
  local iskeyword = vim.opt.iskeyword
  local opposite = mappings[word]
  vim.opt.iskeyword = iskeyword
  if opposite then vim.cmd.normal("ciw" .. opposite) end
end

return M
