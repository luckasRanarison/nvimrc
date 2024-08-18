local mp = require "utils.mappings"
local helpers = require "config.helpers"

local lsp = vim.lsp
local ms = lsp.protocol.Methods
local handlers = lsp.handlers

local L, A, cmd = mp.leader, mp.alt, mp.cmd

handlers[ms.textDocument_hover] = lsp.with(handlers.hover, { border = "rounded" })

lsp.inlay_hint.toggle = function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled()) end

-- lsp.log.set_level(lsp.log.levels.DEBUG)

local keymaps = {
  [ms.textDocument_references] = {
    ["gr"] = { cmd "Telescope lsp_references", desc = "Symbol references" },
  },
  [ms.textDocument_definition] = {
    ["gd"] = { cmd "Telescope lsp_definitions", desc = "Symbol definitions" },
  },
  [ms.textDocument_documentSymbol] = {
    [L "ls"] = { cmd "Telescope lsp_document_symbols", desc = "Document symbols" },
  },
  [ms.workspace_symbol] = {
    [L "lS"] = { cmd "Telescope lsp_workspace_symbols", desc = "Workspace symbols" },
  },
  [ms.textDocument_codeAction] = {
    [L "la"] = { vim.lsp.buf.code_action, desc = "Code actions" },
  },
  [ms.textDocument_rename] = {
    [L "lr"] = { vim.lsp.buf.rename, desc = "Rename symbol" },
  },
  [ms.textDocument_codeLens] = {
    [L "ll"] = { vim.lsp.codelens.run, desc = "Run codelens" },
    [L "lL"] = { vim.lsp.codelens.refresh, desc = "Refresh codelens" },
  },
  [ms.textDocument_inlayHint] = {
    [L "lh"] = { vim.lsp.inlay_hint.toggle, desc = "Toggle Inlay hints" },
  },
  [ms.textDocument_publishDiagnostics] = {
    [A "i"] = { function() vim.diagnostic.jump({ count = 1 }) end, desc = "Next diagnostic" },
    [A "o"] = { function() vim.diagnostic.jump({ count = -1 }) end, desc = "Prev diagnostic" },
    [L "ld"] = { vim.diagnostic.open_float, desc = "Show diagnostics" },
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_clients({ id = args.data.client_id })[1]
    if client then helpers.set_lsp_keymaps(keymaps, client, args.buf) end
  end,
})
