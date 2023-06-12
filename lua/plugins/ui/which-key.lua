local format = require("utils.icons").format

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    require("which-key").register({
      c = { name = format("Color", "Color") },
      m = { name = format("Minimap", "Minimap") },
      b = { name = format("Windows", "Buffers") },
      u = { name = format("Ellipsis", "Fold") },
      g = { name = format("Git", "Git") },
      t = { name = format("Terminal", "Terminal") },
      f = { name = format("Search", "Telescope") },
      l = { name = format("Braces", "LSP") },
      d = { name = format("Debugger", "Debugger") },
      S = { name = format("FolderClock", "Session") },
    }, { prefix = "<leader>" })
  end,
  opts = {
    icons = {
      group = "",
    },
  },
}
