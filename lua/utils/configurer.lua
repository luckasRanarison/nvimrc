local M = {}

--- @class options
--- @field opt table<string, string>
--- @field g table<string,string>

--- Set neovim options
--- @param options options neovim options table
M.set_options = function(options)
  for opt, variables in pairs(options) do
    for key, value in pairs(variables) do
      vim[opt][key] = value
    end
  end
end

--- @class mappings
--- @field n table<string, string>
--- @field v table<string, string>
--- @field i table<string, string>
--- @field x table<string, string>

--- Set neovim keymaps
--- @param mappings mappings neovim keymaps table
M.set_mappings = function(mappings)
  for mode, maps in pairs(mappings) do
    for key, map in pairs(maps) do
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap(mode, key, map, opts)
    end
  end
end

-- --- Initialize autocmd
-- --- @param autocmd table<string, table>
-- M.set_autocmd = function(autocmd)
--   local cmd = vim.api.nvim_create_autocmd

--   for triggers, settings in pairs(autocmd) do
--     cmd(triggers, settings)
--   end
-- end

--- Setup packer plugins
--- @param plugins any plugin data
M.setup_plugins = function(plugins)
  vim.cmd [[packadd packer.nvim]]

  local host = vim.g.vscode and "vscode" or "neovim"
  local packer_config = require(host .. ".plugins.packer.config")
  local packer_compiled_path = host .. ".plugins.packer.packer_compiled"
  local packer_ok, _ = pcall(require, packer_compiled_path)

  require("packer").startup({
    function(use)
      use { "wbthomason/packer.nvim", opt = true }
      for plugin_id, plugin_data in pairs(plugins) do
        -- NVchad style ["plugin"] = {...}
        if type(plugin_id) ~= "number" then
          table.insert(plugin_data, 1, plugin_id)
        end
        use(plugin_data)
      end
    end,

    config = packer_config
  })

  if not packer_ok then
    vim.cmd("PackerCompile")
  end

  -- Run all config scripts
  vim.cmd("runtime! lua/" .. host .. "/plugins/config/*.lua")
end

return M
