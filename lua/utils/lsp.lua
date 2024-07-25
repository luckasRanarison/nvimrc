local M = {}

M.show_diagnostics = function()
  local _, win = vim.diagnostic.open_float()
  if win then
    vim.api.nvim_win_set_config(win, { border = "rounded" })
    vim.wo[win].signcolumn = "yes:1"
  end
end

M.toggle_inlay_hints = function()
  local is_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not is_enabled)
end

return M
