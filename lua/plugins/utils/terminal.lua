local M = {}
local Terminal = require("toggleterm.terminal").Terminal

M.lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  float_opts = {
    width = 120,
    height = 25,
  },
})

M.glow = Terminal:new({
  cmd = "glow",
  hidden = true,
  float_opts = {
    width = 120,
    height = 33,
  },
})

return M
