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
      n = { name = format("Notification", "Notification") },
      S = { name = format("FolderClock", "Session") },
      r = { name = format("Code", "SnipRun") },
      o = { name = format("DropDown", "Dropbar") },
      C = { name = format("Package", "Crates") },
    }, { prefix = "<leader>" })
  end,
  opts = {
    icons = {
      group = "",
    },
    window = {
      border = "rounded",
    },
  },
}
