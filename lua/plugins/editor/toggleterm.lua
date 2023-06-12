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
        guibg = "#16161e"
      },
      NormalFloat = {
        guibg = "#16161e",
      },
    },
  },
}
