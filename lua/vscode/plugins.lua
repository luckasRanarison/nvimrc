return {
  {
    "kylechui/nvim-surround",
    keys = {
      { "cs", mode = { "n" } },
      { "ds", mode = { "n" } },
      { "ys", mode = { "n" } },
      { "S",  mode = { "v" } },
    },
    opts = {},
  },
  {
    "fedepujol/move.nvim",
    cmd = {
      "MoveLine",
      "MoveHChar",
      "MoveBlock",
      "MoveHBlock",
    },
  },
  {
    "folke/flash.nvim",
    opts = {},
  },
}
