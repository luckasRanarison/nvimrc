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
  opts = function()
    local null_ls = require("null-ls")

    return {
      debug = false,
      on_attach = require("lsp.setup").setup_formatting,
      ensure_installed = {
        "clang-format",
        "prettierd",
        "rustfmt",
        "shfmt",
        "stylua",
      },
      sources = {
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "-style={IndentWidth: 4}" },
        }),
      },
    }
  end,
}
