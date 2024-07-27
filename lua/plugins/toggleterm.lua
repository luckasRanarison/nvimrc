local MP = require "utils.mappings"

local L, cmd = MP.leader, MP.cmd

local function open_lazygit()
  require("toggleterm.terminal").Terminal
    :new({
      cmd = "lazygit",
      hidden = true,
      float_opts = { width = 100, height = 25 },
      on_close = function()
        if package.loaded["neo-tree"] then require("neo-tree.events").fire_event "git_event" end
      end,
    })
    :open()
end

return {
  "akinsho/toggleterm.nvim",
  keys = {
    { L "tl", open_lazygit, desc = "Open lazygit" },
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
