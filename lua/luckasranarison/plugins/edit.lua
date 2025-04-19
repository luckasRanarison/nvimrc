local km = require("luckasranarison.utils.keymaps")

local A, cmd, rcmd = km.A, km.cmd, km.rcmd

return {
  {
    "fedepujol/move.nvim",
    keys = {
      { A("j"), cmd("MoveLine(1)"), mode = { "n" }, desc = "Move line down" },
      { A("k"), cmd("MoveLine(-1)"), mode = { "n" }, desc = "Move line up" },
      { A("h"), cmd("MoveHChar(-1)"), mode = { "n" }, desc = "Move char left" },
      { A("l"), cmd("MoveHChar(1)"), mode = { "n" }, desc = "Move char right" },
      { A("j"), rcmd("MoveBlock(1)"), mode = { "v" }, desc = "Move blcok down" },
      { A("k"), rcmd("MoveBlock(-1)"), mode = { "v" }, desc = "Move block up" },
      { A("h"), rcmd("MoveHBlock(-1)"), mode = { "v" }, desc = "Move block left" },
      { A("l"), rcmd("MoveHBlock(1)"), mode = { "v" }, desc = "Move block right" },
    },
    opts = {
      char = { enable = true },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    keys = {
      { "cs", mode = { "n" }, desc = "Change surrounding pair" },
      { "ds", mode = { "n" }, desc = "Delete surrounding pair" },
      { "ys", mode = { "n" }, desc = "Add surrounding pair" },
      { "S", mode = { "v" }, desc = "Add surrounding pair" },
    },
    opts = {},
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes_denylist = { "dropbar_menu" },
      large_file_cutoff = 5000,
      min_count_to_highlight = 2,
    },
    config = function(_, opts) require("illuminate").configure(opts) end,
  },
}
