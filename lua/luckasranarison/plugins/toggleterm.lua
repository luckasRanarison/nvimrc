local km = require("luckasranarison.utils.keymaps")
local terminals = require("luckasranarison.plugins.modules.toggleterm")

local L, cmd = km.L, km.cmd

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { L("tl"), terminals.lazygit, desc = "Open lazygit" },
    { L("tf"), cmd("ToggleTerm"), desc = "Open floating terminal" },
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
