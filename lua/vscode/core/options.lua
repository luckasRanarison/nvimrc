local options = {
  -- Set options
  opt = {
    fileencoding = "utf-8",
    ignorecase = true,
    undofile = true
  },

  -- Globals
  g = {
    mapleader = " ",

    -- Disable built-in plugins
    zipPlugin = false,
    load_black = false,
    loaded_2html_plugin = true,
    loaded_getscript = true,
    loaded_getscriptPlugin = true,
    loaded_gzip = true,
    loaded_logipat = true,
    loaded_matchit = true,
    loaded_netrwFileHandlers = true,
    loaded_netrwPlugin = true,
    loaded_netrwSettngs = true,
    loaded_remote_plugins = true,
    loaded_tar = true,
    loaded_tarPlugin = true,
    loaded_zip = true,
    loaded_zipPlugin = true,
    loaded_vimball = true,
    loaded_vimballPlugin = true,
  }
}

for opt, variables in pairs(options) do
  for key, value in pairs(variables) do
    vim[opt][key] = value
  end
end
