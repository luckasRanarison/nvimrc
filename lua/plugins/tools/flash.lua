local map = require("utils.mappings")

return {
  "folke/flash.nvim",
  keys = {
    { "f", mode = { "n", "v" } },
    { "F", mode = { "n", "v" } },
    { "t", mode = { "n", "v" } },
    { "T", mode = { "n", "v" } },

    { "s", mode = { "n", "v" }, map.lua('require("flash").jump()') },
    { "ß", mode = "n", map.lua("require('flash').jump({ pattern = vim.fn.expand('<cword>') })") },
    { "S", mode = "n", map.lua("require('flash').treesitter()") },
    { "o", mode = "o", map.lua("require('flash').jump()"), desc = "Search jump" },
    { "O", mode = "o", map.lua("require('flash').treesitter()"), desc = "Tresitter jump" },
  },
  opts = {},
}
