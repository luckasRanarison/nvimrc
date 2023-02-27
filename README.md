# Description

I am not a neovim expert but this is my attempt of creating a flexible neovim configuration system for the normal Neovim and the VSCode Neovim extension.
Feel free to use this as a template and play around with it if you like :).

# Structure

Each host share the following structure but you can add more modules if you like

```
Host
├── core
│   ├── autocmd.lua
│   ├── mappings.lua
│   └── options.lua
├── init.lua
└── plugins
    ├── config
    │   └── plugin_config.lua
    ├── packer
    │   ├── config.lua
    │   └── packer_compiled.lua
    └── init.lua
```

See `utils.configurer` and the premade configuration files to see how the configuration table for each component is structured, `utils.configurer` provides a set of methods for parsing the configurations tables.

A basic init.lua would look like this:

```lua
local configurer = require "utils.configurer"
local options = require "host.core.options"
local mappings = require "host.core.mappings"
local plugins = require "host.plugins"
local autocmd = require "host.core.autocmd"

configurer.set_autocmd(autocmd)
configurer.set_options(options)
configurer.set_mappings(mappings)
configurer.setup_plugins(plugins)
```

