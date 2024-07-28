local M = {}

M.show_diagnostics = function()
  vim.diagnostic.open_float({
    border = "rounded",
    header = " Diagnostics:",
    prefix = function(_, i) return " " .. i .. " - ", "" end,
  })
end

M.toggle_inlay_hints = function()
  local is_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not is_enabled)
end

return M
