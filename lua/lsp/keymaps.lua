local format = require("utils.icons").format

return {
  ["textDocument/formatting"] = {
    ["<leader>bf"] = {
      value = ":lua vim.lsp.buf.format()<CR>",
      desc = format("Format", "Format buffer"),
    },
  },
  ["textDocument/publishDiagnostics"] = {
    ["<leader>ld"] = {
      value = ":lua vim.diagnostic.open_float()<CR>",
      desc = format("Warn", "Hover diagnostic"),
    },
    ["<F8>"] = { value = ":lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
    ["[<F8>"] = { value = ":lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic" },
  },
  ["textDocument/codeAction"] = {
    ["<leader>la"] = {
      value = ":lua vim.lsp.buf.code_action()<CR>",
      desc = format("Fix", "Code action"),
    },
  },
  ["textDocument/definition"] = {
    ["gd"] = { value = ":lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  },
  ["textDocument/declaration"] = {
    ["gD"] = { value = ":lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
  },
  ["textDocument/hover"] = {
    ["K"] = { value = ":lua vim.lsp.buf.hover()<CR>", desc = "Hover info" },
  },
  ["textDocument/implementation"] = {
    ["gI"] = { value = ":Telescope lsp_implementations<CR>", desc = "Symbol implementation" },
  },
  ["textDocument/references"] = {
    ["gr"] = { value = ":Telescope lsp_references<CR>", desc = "Go to reference" },
  },
  ["textDocument/rename"] = {
    ["<leader>lr"] = {
      value = ":lua vim.lsp.buf.rename()<CR>",
      desc = format("Edit", "Rename symbol"),
    },
  },
  ["textDocument/signatureHelp"] = {
    ["<leader>lh"] = {
      value = ":lua vim.lsp.buf.signature_help()<CR>",
      desc = format("Help", "Signature help"),
    },
  },
  ["textDocument/typeDefinition"] = {
    ["gT"] = { value = ":lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition" },
  },
  ["textDocument/codeLens"] = {
    ["<leader>ll"] = {
      value = ":lua vim.lsp.codelens.run()<CR>",
      desc = format("Run", "Run codelens"),
    },
    ["<leader>lL"] = {
      value = ":lua vim.lsp.codelens.refresh()<CR>",
      desc = format("Restart", "Refresh codelens"),
    },
  },
  ["workspace/symbol"] = {
    ["<leader>ls"] = {
      value = ":lua vim.lsp.buf.workspace_symbol()<CR>",
      desc = format("Variable", "Workspace symbols"),
    },
  },
}
