local filetypes = {
  extension = {
    ic = "icelang",
    rasi = "rasi",
    ebnf = "ebnf",
  },
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
}

vim.filetype.add(filetypes)

local signs = {
  { name = "DapBreakpoint", text = "", texthl = "Breakpoint" },
  { name = "DiagnosticSignHint", text = "", texthl = "DiagnosticHint" },
  { name = "DiagnosticSignError", text = "󰅚", texthl = "DiagnosticError" },
  { name = "DiagnosticSignWarn", text = "", texthl = "DiagnosticWarn" },
  { name = "DiagnosticSignInfo", text = "󰋽", texthl = "DiagnosticInfo" },
}

vim.fn.sign_define(signs)

local lsp = vim.lsp
local ms = lsp.protocol.Methods

lsp.handlers[ms.textDocument_hover] = lsp.with(lsp.handlers.hover, { border = "rounded" })

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
