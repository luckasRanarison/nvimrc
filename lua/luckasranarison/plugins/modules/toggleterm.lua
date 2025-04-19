local Terminal = function() return require("toggleterm.terminal").Terminal end

return {
  lazygit = function()
    Terminal():new({
      cmd = "lazygit",
      hidden = true,
      float_opts = { width = 90, height = 23 },
    }):open()
  end,
}
