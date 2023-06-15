local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local disabled = { "tailwindcss" }

return {
  function(server_name)
    for _, name in ipairs(disabled) do
      if server_name == name then return end
    end

    lspconfig[server_name].setup({
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
}
