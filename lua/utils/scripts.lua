local M = {}

M.set_indent_input = function()
  local value = vim.fn.input({ prompt = "Set indentation: " })
  vim.bo[0].shiftwidth = tonumber(value)
end

M.open_help_float = function()
  local ui = vim.api.nvim_list_uis()[1]
  local width = 80
  local height = 25
  local row = (ui.height - height) * 0.4
  local col = (ui.width - width) * 0.5
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)

  vim.api.nvim_win_set_config(win, {
    col = col,
    row = row,
    width = width,
    height = height,
    border = "rounded",
    relative = "editor",
    style = "minimal",
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(win),
    callback = function() vim.api.nvim_buf_delete(buf, {}) end,
  })
end

return M
