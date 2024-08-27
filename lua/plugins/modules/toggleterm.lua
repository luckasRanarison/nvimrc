local M = {}

M.lazygit = function()
  require("toggleterm.terminal").Terminal
    :new({
      cmd = "lazygit",
      hidden = true,
      float_opts = { width = 100, height = 25 },
    })
    :open()
end

return M
