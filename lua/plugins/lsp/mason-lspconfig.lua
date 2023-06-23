local handlers = require("lsp.handlers")

return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    handlers = handlers,
    ensure_installed = {
      "rust_analyzer",
      "tsserver",
      "lua_ls",
      "bashls",
      "html",
      "cssls",
      "emmet_ls",
      "tailwindcss",
      "clangd",
      "vimls",
      "sqlls",
      "jsonls",
      "taplo",
    },
  },
}
