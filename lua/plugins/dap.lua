return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>d", mode = { "n" } },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      handlers = {},
      ensure_installed = require "packages.dap",
    },
  },
}
