return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      javacript = { "prettierd" },
      typescript = { "prettierd" },
      javacriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      html = { "prettierd" },
      css = { "prettierd" },
      php = { "php-cs-fixer" },
      json = { "prettierd" },
      toml = { "prettierd" },
      python = { "black" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      java = { "clang-format" },
    },
    format_after_save = {
      lsp_format = "fallback",
    },
  },
}
