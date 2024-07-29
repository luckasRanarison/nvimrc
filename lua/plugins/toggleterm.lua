local mp = require "utils.mappings"
local term = require "plugins.modules.toggleterm"

local L, cmd = mp.leader, mp.cmd

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { L "tl", term.lazygit, desc = "Open lazygit" },
    { L "tf", cmd "ToggleTerm", desc = "Open floating terminal" },
    { L "th", cmd "ToggleTerm direction=horizontal", desc = "Open horizontal terminal" },
    { L "tv", cmd "ToggleTerm direction=vertical size=60", desc = "Open vertical terminal" },
  },
  opts = {
    shade_terminals = false,
    direction = "float",
    float_opts = { border = "rounded", width = 80 },
    highlights = {
      FloatBorder = {
        link = "FloatBorder",
      },
    },
  },
}
