local lsp = vim.lsp
local ms = vim.lsp.protocol.Methods

lsp.handlers[ms.textDocument_hover] = lsp.with(lsp.handlers.hover, { border = "rounded" })

lsp.buf.toggle_ilay_hint = function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled()) end

-- vim.lsp.set_log_level(vim.lsp.log_levels.DEBUG)
