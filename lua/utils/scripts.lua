local M = {}

M.append_semicolon = function()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(line .. ";")
end

return M
