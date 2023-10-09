local map = require("utils.mappings")
local format = require("utils.icons").format

return {
  ["textDocument/formatting"] = {
    ["<leader>lf"] = {
      value = map.lua("require('lsp.utils').format_async(0)"),
      desc = format("Format", "Format buffer"),
    },
  },
  ["textDocument/publishDiagnostics"] = {
    ["<leader>ld"] = {
      value = map.lua("require('utils.scripts').diagnostics_float()"),
      desc = format("Warn", "Hover diagnostic"),
    },
    ["<A-i>"] = {
      value = map.lua("vim.diagnostic.goto_next()"),
      desc = "Next diagnostic",
    },
    ["<A-o>"] = {
      value = map.lua("vim.diagnostic.goto_prev()"),
      desc = "Previous diagnostic",
    },
  },
  ["textDocument/codeAction"] = {
    ["<leader>a "] = {
      value = map.cmd("CodeActionToggleLabel"),
      desc = format("Toggle", "Toggle label"),
    },
  },
  ["textDocument/definition"] = {
    ["gd"] = {
      value = map.lua("vim.lsp.buf.definition()"),
      desc = "Go to definition",
    },
  },
  ["textDocument/declaration"] = {
    ["gD"] = {
      value = map.lua("vim.lsp.buf.declaration()"),
      desc = "Go to declaration",
    },
  },
  ["textDocument/hover"] = {
    ["K"] = {
      value = map.lua("vim.lsp.buf.hover()"),
      desc = "Hover info",
    },
  },
  ["textDocument/implementation"] = {
    ["gI"] = {
      value = ":Telescope lsp_implementations<CR>",
      desc = "Symbol implementation",
    },
  },
  ["textDocument/references"] = {
    ["gr"] = {
      value = ":Telescope lsp_references<CR>",
      desc = "Go to reference",
    },
  },
  ["textDocument/rename"] = {
    ["<leader>lr"] = {
      value = map.lua("vim.lsp.buf.rename()"),
      desc = format("Edit", "Rename symbol"),
    },
  },
  ["textDocument/signatureHelp"] = {
    ["<leader>lH"] = {
      value = map.lua("vim.lsp.buf.signature_help()"),
      desc = format("Help", "Signature help"),
    },
  },
  ["textDocument/typeDefinition"] = {
    ["gT"] = {
      value = map.lua("vim.lsp.buf.type_definition()"),
      desc = "Go to type definition",
    },
  },
  ["textDocument/codeLens"] = {
    ["<leader>ll"] = {
      value = map.lua("vim.lsp.codelens.refresh() vim.lsp.codelens.run()"),
      desc = format("Run", "Run codelens"),
    },
    ["<leader>lL"] = {
      value = map.lua("vim.lsp.codelens.refresh()"),
      desc = format("Restart", "Refresh codelens"),
    },
  },
  ["workspace/symbol"] = {
    ["<leader>ls"] = {
      value = map.lua("vim.lsp.buf.workspace_symbol()"),
      desc = format("Variable", "Workspace symbols"),
    },
  },
  ["workspace/inlayHint"] = {
    ["<leader>lh"] = {
      value = map.lua("vim.lsp.inlay_hint(0, nil)"),
      desc = format("Toggle", "Toggle inlay hint"),
    },
  },
}
