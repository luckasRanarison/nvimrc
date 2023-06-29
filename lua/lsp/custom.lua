local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

configs.icelang_ls = {
  default_config = {
    cmd = { "/home/luckas/Projects/icelang/target/debug/icelang-ls" },
    filetypes = { "icelang" },
    root_dir = function() return vim.fn.getcwd() end,
  },
}

lspconfig.icelang_ls.setup({})

return lspconfig
