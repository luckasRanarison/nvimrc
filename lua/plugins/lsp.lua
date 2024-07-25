return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "I",
          package_pending = "P",
          package_uninstalled = "U",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = require "packages.lsp",
      handlers = {
        function(server_name) require("lspconfig")[server_name].setup({}) end,
      },
    },
  },
}
