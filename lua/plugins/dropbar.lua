local mp = require "utils.mappings"
local L = mp.leader

return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { L "oo", function() require("dropbar.api").pick() end, desc = "Pick dropbar" },
  },
  opts = {
    icons = {
      ui = {
        bar = {
          separator = "  ",
        },
      },
      kinds = {
        use_devicons = false,
        symbols = {
          File = "",
          Folder = "",
        },
      },
    },
  },
}
