local capabilities = require("lsp.config").get_capabilities()

local M = {}

-- Default handler
M[1] = function(server_name)
  require("lspconfig")[server_name].setup({ capabilities = capabilities })
end

M.lua_ls = function()
  require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        hint = {
          enable = true,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            "/usr/local/share/nvim/runtime/lua",
            "~/.local/share/nvim/lazy/neodev.nvim/types/stable",
          },
        },
      },
    },
  })
end

M.cssls = function()
  require("lspconfig").cssls.setup({
    capabilities = capabilities,
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  })
end

M.tailwindcss = function()
  require("lspconfig").tailwindcss.setup({
    -- capabilities = capabilities,
    -- on_attach = function() require("document-color").buf_attach(0) end,
  })
end

M.clangd = function()
  require("lspconfig").clangd.setup({
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })
end

return M
