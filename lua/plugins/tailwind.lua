local mp = require "utils.mappings"

local L, cmd = mp.leader, mp.cmd

return {
  dir = "~/Projects/tailwind-tools.nvim",
  event = { "BufReadPost", "BufNewFile" },
  name = "tailwind-tools",
  keys = {
    { L "cs", cmd "TailwindSort", desc = "Sort classes" },
    { L "cs", cmd "TailwindSortSelection", mode = { "v" }, desc = "Sort classes" },
    { L "cc", cmd "TailwindConcealToggle", desc = "Toggle conceal" },
    { L "ct", cmd "TailwindColorToggle", desc = "Toggle colors" },
    { L "cn", cmd "TailwindNextClass", desc = "Next class" },
    { L "cp", cmd "TailwindPrevClass", desc = "Prev class" },
  },
  opts = {
    telescope = {},
  },
}
