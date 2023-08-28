return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local lspconfig_configs = require("lspconfig.configs")
    local configs = require("lsp.config")
    local capabilities = require("lsp.capabilities")

    for server, config in pairs(configs.custom) do
      lspconfig_configs[server] = config
      lspconfig[server].setup({ capabilities = capabilities })
    end
  end,
}
