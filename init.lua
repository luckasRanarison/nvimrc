local options = require("core.options")
local keymaps = require("core.keymaps")
local autocmd = require("core.autocmd")
local signs = require("core.signs")
local filetypes = require("core.filetypes")
local configurer = require("utils.configurer")


configurer.set_options(options)
configurer.set_keymaps(keymaps)
configurer.set_autocmd(autocmd)
configurer.set_signs(signs)
configurer.init_lazy()

vim.filetype.add(filetypes)
