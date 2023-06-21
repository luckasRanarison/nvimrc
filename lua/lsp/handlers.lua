local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local disabled = { "tailwindcss" }

return {
  function(server_name)
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

  ["rust_analyzer"] = function()
    require("rust-tools").setup({
      tools = {
        inlay_hints = {
          auto = false
        }
      },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(
          "/home/luckas/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
          "/home/luckas/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
        ),
      },
    })
  end,

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          hint = {
            enable = true
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
  end
}
