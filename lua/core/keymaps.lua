local MP = require "utils.mappings"
local prompt = require "utils.prompt"
local lsp_utils = require "utils.lsp"

local ms = vim.lsp.protocol.Methods
local L, C, A, cmd = MP.leader, MP.ctrl, MP.alt, MP.cmd

local keymaps = {
  i = {
    ["jj"] = { "<esc>" },
  },
  n = {
    [L "w"] = { cmd "w", "Save file" },
    [L "W"] = { cmd "w!", "Save file!" },
    [L "q"] = { cmd "q", "Exit window" },
    [L "Q"] = { cmd "q!", "Exit window!" },
    [L "%"] = { cmd "luafile %", "Luafile" },
    [L " "] = { cmd "wincmd w", "Switch window" },

    [L "p"] = { '"+p', "Paste from clipboard (down)" },
    [L "P"] = { '"+P', "Paste from clipboard (up)" },

    [L "us"] = { cmd "nohlsearch", "Clear search highlights" },
    [L "ui"] = { prompt.set_indent, "Set indentation" },
    [L "uI"] = { prompt.set_indent_type, "Set indentation type" },
    [L "uf"] = { prompt.set_filetype, "Set filetype" },

    [C "h"] = { cmd "wincmd h", "Move to left window" },
    [C "j"] = { cmd "wincmd j", "Move to bottom window" },
    [C "k"] = { cmd "wincmd k", "Move to top window" },
    [C "l"] = { cmd "wincmd l", "Move to right window" },
  },
  v = {
    ["q"] = { "<esc>" },
    [L "p"] = { '"+p', "Paste from clipboard (down)" },
    [L "P"] = { '"+P', "Paste from clipboard (up)" },
    [L "y"] = { '"+y', "Yank to clipboard" },
  },
  t = {
    ["<esc>"] = { [[<C-\><C-n>]] },
    [C "h"] = { cmd "wincmd h", "Move to left window" },
    [C "j"] = { cmd "wincmd j", "Move to bottom window" },
    [C "k"] = { cmd "wincmd k", "Move to top window" },
    [C "l"] = { cmd "wincmd l", "Move to right window" },
  },
}

local lsp_keymaps = {
  [ms.textDocument_references] = {
    ["gr"] = { cmd "Telescope lsp_references", "Symbol references" },
  },
  [ms.textDocument_definition] = {
    ["gd"] = { cmd "Telescope lsp_definitions", "Symbol definitions" },
  },
  [ms.textDocument_codeAction] = {
    [L "la"] = { vim.lsp.buf.code_action, "Code actions" },
  },
  [ms.textDocument_rename] = {
    [L "lr"] = { vim.lsp.buf.rename, "Rename symbol" },
  },
  [ms.textDocument_codeLens] = {
    [L "ll"] = { vim.lsp.codelens.run, "Run codelens" },
    [L "lL"] = { vim.lsp.codelens.refresh, "Refresh codelens" },
  },
  [ms.textDocument_inlayHint] = {
    [L "lh"] = { lsp_utils.toggle_inlay_hints, "Toggle Inlay hints" },
  },
  [ms.textDocument_publishDiagnostics] = {
    [A "i"] = { function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic" },
    [A "o"] = { function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic" },
    [L "ld"] = { lsp_utils.show_diagnostics, "Show diagnostics" },
  },
}

local function register_lsp_keymaps(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  if not client then return end

  for method, mappings in pairs(lsp_keymaps) do
    if client.supports_method(method) then
      for lhs, mapping in pairs(mappings) do
        vim.keymap.set("n", lhs, mapping[1], { desc = mapping[2], buffer = args.buf })
      end
    end
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = register_lsp_keymaps,
  desc = "Dynamically registers LSP keymaps on server attach",
})

for mode, mappings in pairs(keymaps) do
  for lhs, mapping in pairs(mappings) do
    vim.keymap.set(mode, lhs, mapping[1], { desc = mapping[2] })
  end
end
