local M = {}

M.custom = {
  icelang_ls = {
    default_config = {
      root_dir = function() return vim.fn.getcwd(0) end,
      name = "icelang-ls",
      cmd = { "icelang-ls" },
      filetypes = { "icelang" },
    },
  },
}

M.handlers = {
  lua_ls = {
    settings = {
      Lua = {
        hint = {
          enable = true,
        },
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },

  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },

  tailwindcss = {
    on_attach = function()
      local bufnr = vim.api.nvim_get_current_buf()
      require("document-color").buf_attach(bufnr)
    end,
  },

  bashls = {
    filetypes = { "sh", "zsh" },
  },

  clangd = {
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  },
}

return M
