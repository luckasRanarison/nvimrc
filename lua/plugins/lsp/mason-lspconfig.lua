local lsp_utils = require("lsp.utils")

return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    handlers = lsp_utils.get_handlers(),
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
      "jsonls",
      "taplo",
      "jdtls",
    },
  },
}
