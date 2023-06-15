return {
  "mfussenegger/nvim-dap",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {},
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        handlers = {},
        ensure_installed = {
          "codelldb",
          "node-debug2-adapter",
        },
      },
    },
  },
}
