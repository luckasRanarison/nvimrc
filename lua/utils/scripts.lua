local M = {}

M.set_indent_input = function()
  local value = vim.fn.input({ prompt = "Set indentation: " })
  vim.bo[0].shiftwidth = tonumber(value)
end

return M
