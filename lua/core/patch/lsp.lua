local lsp = vim.lsp
local ms = lsp.protocol.Methods

lsp.handlers[ms.textDocument_hover] = lsp.with(lsp.handlers.hover, { border = "rounded" })

-- lsp.log.set_level(vim.lsp.log.levels.DEBUG)
