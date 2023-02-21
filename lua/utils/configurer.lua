local M = {}

---@class options
---@field opt table<string, string>
---@field g table<string,string>

---Set neovim options
---@param options options neovim options table
M.set_options = function(options)
  for opt, variables in pairs(options) do
    for key, value in pairs(variables) do
      vim[opt][key] = value
    end
  end
end

---@class mappings
---@field n table<string, string>
---@field v table<string, string>
---@field i table<string, string>
---@field x table<string, string>

---Set neovim keymaps
---@param mappings mappings neovim keymaps table
M.set_mappings = function(mappings)
  for mode, maps in pairs(mappings) do
    for key, map in pairs(maps) do
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap(mode, key, map, opts)
    end
  end
end

---Setup packer plugins
---@param plugins any plugin data
M.setup_plugins = function(plugins)
  vim.cmd [[packadd packer.nvim]]

  require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    for plugin_id, plugin_data in pairs(plugins) do
      --NVchad style ["plugin"] = {...}
      if type(plugin_id) ~= "number" then
        table.insert(plugin_data, 1, plugin_id)
      end
      use(plugin_data)
    end
  end)
end

---Fetch plugins config
---@param plugins table<string> list of configured plugins
---@param host "neovim" | "vscode" neovim host
M.configure_plugins = function(plugins, host)
  local path = host .. ".plugins.config."
  for _, plugin_name in ipairs(plugins) do
    require(path .. plugin_name)
  end
end

return M
