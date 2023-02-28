local host = vim.g.vscode and "vscode" or "neovim"

local configurer = require "utils.configurer"
local autocmd = require(host .. ".core.autocmd")
local options = require(host .. ".core.options")
local mappings = require(host .. ".core.mappings")
local plugins = require(host .. ".plugins")

configurer.set_autocmd(autocmd)
configurer.set_options(options)
configurer.set_mappings(mappings)
configurer.setup_plugins(plugins)
