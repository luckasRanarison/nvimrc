local lsp = vim.lsp
local ms = lsp.protocol.Methods
local handlers = lsp.handlers

handlers[ms.textDocument_hover] = lsp.with(handlers.hover, { border = "rounded" })

lsp.inlay_hint.toggle = function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled()) end

-- lsp.log.set_level(lsp.log.levels.DEBUG)
