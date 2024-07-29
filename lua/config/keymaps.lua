local mp = require "utils.mappings"
local prompt = require "modules.prompt"
local toggle = require "modules.toggle"
local helpers = require "config.helpers"

local ms = vim.lsp.protocol.Methods
local L, C, A, cmd = mp.leader, mp.ctrl, mp.alt, mp.cmd

local keymaps = {
  i = {
    ["jj"] = { "<esc>" },
  },
  n = {
    [L "w"] = { cmd "w", desc = "Save file" },
    [L "W"] = { cmd "w!", desc = "Save file!" },
    [L "q"] = { cmd "q", desc = "Exit window" },
    [L "Q"] = { cmd "q!", desc = "Exit window!" },
    [L "%"] = { cmd "luafile %", desc = "Luafile" },
    [L " "] = { cmd "wincmd w", desc = "Switch window" },

    [L "p"] = { '"+p', desc = "Paste from clipboard (down)" },
    [L "P"] = { '"+P', desc = "Paste from clipboard (up)" },

    [L "us"] = { cmd "nohlsearch", desc = "Clear search highlights" },
    [L "ui"] = { prompt.set_indent, desc = "Set indentation" },
    [L "uI"] = { prompt.set_indent_type, desc = "Set indentation type" },
    [L "uf"] = { prompt.set_filetype, desc = "Set filetype" },
    [L "ut"] = { toggle.switch, desc = "Toggle word" },

    [C "h"] = { cmd "wincmd h", desc = "Move to left window" },
    [C "j"] = { cmd "wincmd j", desc = "Move to bottom window" },
    [C "k"] = { cmd "wincmd k", desc = "Move to top window" },
    [C "l"] = { cmd "wincmd l", desc = "Move to right window" },
  },
  v = {
    ["q"] = { "<esc>" },
    [L "p"] = { '"+p', desc = "Paste from clipboard (down)" },
    [L "P"] = { '"+P', desc = "Paste from clipboard (up)" },
    [L "y"] = { '"+y', desc = "Yank to clipboard" },
  },
  t = {
    ["<esc>"] = { [[<C-\><C-n>]] },
    [C "h"] = { cmd "wincmd h", desc = "Move to left window" },
    [C "j"] = { cmd "wincmd j", desc = "Move to bottom window" },
    [C "k"] = { cmd "wincmd k", desc = "Move to top window" },
    [C "l"] = { cmd "wincmd l", desc = "Move to right window" },
  },
}

helpers.set_keymaps(keymaps)

local lsp_keymaps = {
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
    if client then helpers.set_lsp_keymaps(lsp_keymaps, client, args.buf) end
  end,
})
