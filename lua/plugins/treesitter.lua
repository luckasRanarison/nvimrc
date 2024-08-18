return {
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "php",
      "javascriptreact",
      "typescriptreact",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      ensure_installed = require "packages.parsers",
    },
  },
}
