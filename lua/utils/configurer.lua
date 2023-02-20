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
---@param plugins table<any> plugin data
M.setup_plugins = function(plugins)
  vim.cmd [[packadd packer.nvim]]

  require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
  end)
end

return M
