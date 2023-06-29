return {
  "bennypowers/nvim-regexplainer",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    "gR",
    mode = { "n" },
    desc = "Toggle Regexplainer",
  },
  opts = {
    mappings = {
      toggle = "gR",
    },
    popup = {
      border = {
        style = "none",
      },
    },
  },
}
