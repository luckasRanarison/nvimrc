local servers = require "packages.servers"

return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lspconfig = require "lspconfig"
      local configs = require "lspconfig.configs"

      for _, server in pairs(servers) do
        local has_config, config = pcall(require, "lsp." .. server)

        if not has_config then config = {} end
        if config.custom then configs[server] = { default_config = config } end

        lspconfig[server].setup(config)
      end
    end,
  },
}
