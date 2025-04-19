local M = {}

local lsp = vim.lsp

M.toggle_inlay_hint = function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled()) end

return M
