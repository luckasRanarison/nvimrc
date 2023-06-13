return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm" },
  opts = {
    shade_terminals = false,
    direction = "float",
    float_opts = {
      border = "",
      width = 80,
    },
    highlights = {
      Normal = {
        link = "ToggleTerm",
      },
      NormalFloat = {
        link = "ToggleTerm",
      },
    },
  },
}
