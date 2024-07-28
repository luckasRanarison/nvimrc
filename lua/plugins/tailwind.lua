local MP = require "utils.mappings"

local L, cmd = MP.leader, MP.cmd

return {
  dir = "~/Projects/tailwind-tools.nvim",
  keys = {
    { L "Ts", cmd "TailwindSort", desc = "Sort classes" },
    { L "Tt", cmd "TailwindConcealToggle", desc = "Toggle conceal" },
    { L "Tc", cmd "TailwindColorToggle", desc = "Toggle colors" },
    { L "Tn", cmd "TailwindNextClass", desc = "Next class" },
    { L "Tp", cmd "TailwindPrevClass", desc = "Prev class" },
  },
  opts = {},
}
