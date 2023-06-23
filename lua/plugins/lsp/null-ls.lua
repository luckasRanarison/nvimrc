return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      cmd = { "NullLsInstall", "NullLsUninstall" },
      opts = { handlers = {} },
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = false,
      ensure_installed = {
        "clang-format",
        "prettierd",
        "rustfmt",
        "shfmt",
        "stylua",
        "sqlfmt",
      },
      sources = {
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "-style={IndentWidth: 4}" },
        }),
      },
    })
  end,
}
