local format = require("utils.icons").format

local lua = function(code) return "<cmd>lua " .. code .. "<CR>" end

return {
  ["textDocument/formatting"] = {
    ["<leader>lf"] = {
      value = lua("require('lsp.utils').format_async(0)"),
      desc = format("Format", "Format buffer"),
    },
  },
  ["textDocument/publishDiagnostics"] = {
    ["<leader>ld"] = {
      value = lua("vim.diagnostic.open_float()"),
      desc = format("Warn", "Hover diagnostic"),
    },
    ["<F8>"] = { value = lua("vim.diagnostic.goto_next()"), desc = "Next diagnostic" },
    ["[<F8>"] = { value = lua("vim.diagnostic.goto_prev()"), desc = "Previous diagnostic" },
  },
  ["textDocument/codeAction"] = {
    ["<leader>la"] = {
      value = lua("vim.lsp.buf.code_action()"),
      desc = format("Fix", "Code action"),
    },
  },
  ["textDocument/definition"] = {
    ["gd"] = { value = lua("vim.lsp.buf.definition()"), desc = "Go to definition" },
  },
  ["textDocument/declaration"] = {
    ["gD"] = { value = lua("vim.lsp.buf.declaration()"), desc = "Go to declaration" },
  },
  ["textDocument/hover"] = {
    ["K"] = { value = lua("vim.lsp.buf.hover()"), desc = "Hover info" },
  },
  ["textDocument/implementation"] = {
    ["gI"] = { value = ":Telescope lsp_implementations<CR>", desc = "Symbol implementation" },
  },
  ["textDocument/references"] = {
    ["gr"] = { value = ":Telescope lsp_references<CR>", desc = "Go to reference" },
  },
  ["textDocument/rename"] = {
    ["<leader>lr"] = {
      value = lua("vim.lsp.buf.rename()"),
      desc = format("Edit", "Rename symbol"),
    },
  },
  ["textDocument/signatureHelp"] = {
    ["<leader>lH"] = {
      value = lua("vim.lsp.buf.signature_help()"),
      desc = format("Help", "Signature help"),
    },
  },
  ["textDocument/typeDefinition"] = {
    ["gT"] = { value = lua("vim.lsp.buf.type_definition()"), desc = "Go to type definition" },
  },
  ["textDocument/codeLens"] = {
    ["<leader>ll"] = {
      value = lua("vim.lsp.codelens.run()"),
      desc = format("Run", "Run codelens"),
    },
    ["<leader>lL"] = {
      value = lua("vim.lsp.codelens.refresh()"),
      desc = format("Restart", "Refresh codelens"),
    },
  },
  ["workspace/symbol"] = {
    ["<leader>ls"] = {
      value = lua("vim.lsp.buf.workspace_symbol()"),
      desc = format("Variable", "Workspace symbols"),
    },
  },
  ["workspace/inlayHint"] = {
    ["<leader>lh"] = {
      value = lua("vim.lsp.inlay_hint(0, nil)"),
      desc = format("Toggle", "Toggle inlay hint"),
    },
  },
}
