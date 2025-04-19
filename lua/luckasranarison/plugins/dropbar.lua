local km = require("luckasranarison.utils.keymaps")

local L = km.L

return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { L("oo"), function() require("dropbar.api").pick() end, desc = "Pick dropbar" },
  },
  opts = {
    icons = {
      ui = {
        bar = {
          separator = "  ",
        },
      },
    },
  },
}
