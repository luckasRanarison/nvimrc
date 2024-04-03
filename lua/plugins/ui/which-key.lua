local fmt = require("utils.icons").fmt

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    require("which-key").register({
      a = { name = fmt("Fix", "Actions") },
      c = { name = fmt("Color", "Color") },
      b = { name = fmt("Windows", "Buffers") },
      u = { name = fmt("Window", "UI") },
      g = { name = fmt("Git", "Git") },
      t = { name = fmt("Terminal", "Terminal") },
      f = { name = fmt("Search", "Telescope") },
      l = { name = fmt("Braces", "LSP") },
      d = { name = fmt("Debugger", "Debugger") },
      n = { name = fmt("Notification", "Notification") },
      S = { name = fmt("FolderClock", "Session") },
      r = { name = fmt("Code", "SnipRun") },
      o = { name = fmt("DropDown", "Dropbar") },
      v = { name = fmt("Book", "DevDocs") },
      C = { name = fmt("Package", "Crates") },
      D = { name = fmt("Database", "DbUI") },
    }, { prefix = "<leader>" })
  end,
  opts = {
    key_labels = {
      ["<space>"] = " ",
    },
    icons = {
      group = "",
    },
    window = {
      border = "rounded",
    },
  },
}
