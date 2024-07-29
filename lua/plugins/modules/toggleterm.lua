local M = {}

M.lazygit = function()
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

return M
