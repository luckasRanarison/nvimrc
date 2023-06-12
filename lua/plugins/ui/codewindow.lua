local format = require("utils.icons").format

return {
  "gorbit99/codewindow.nvim",
  keys = {
    { "<leader>mo", desc = format("Open", "Open minimap") },
    { "<leader>mm", desc = format("Toggle", "Toggle minimap") },
  },
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      exclude_filetypes = {
        "help",
        "startify",
        "aerial",
        "alpha",
        "dashboard",
        "lazy",
        "neogitstatus",
        "neo-tree",
        "Trouble",
      },
      relative = "editor",
      width_multiplier = 3,
      window_border = "",
    })
    codewindow.apply_default_keybinds()
  end,
}
