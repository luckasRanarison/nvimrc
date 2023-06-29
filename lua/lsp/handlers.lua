local lspconfig = require("lsp.custom")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  function(server_name)
    local disabled = { "tailwindcss" }
    local autostart = not vim.tbl_contains(disabled, server_name)

    lspconfig[server_name].setup({
      autostart = autostart,
      capabilities = capabilities,
    })
  end,

  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
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
    })
  end,

  ["cssls"] = function()
    lspconfig.cssls.setup({
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
  end,

  ["clangd"] = function()
    capabilities.offsetEncoding = "utf-16"
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })
  end,
}
