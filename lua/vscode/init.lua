local configurer = require "utils.configurer"
local options = require "vscode.core.options"
local mappings = require "vscode.core.mappings"
local plugins = require "vscode.plugins"

configurer.set_options(options)
configurer.set_mappings(mappings)
configurer.setup_plugins(plugins)
