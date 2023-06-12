return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      untracked = { hl = "GitSignsAdd", text = "┃" },
      delete = { hl = "GitSignsDelete", text = "┃" },
      topdelete = { hl = "GitSignsDelete", text = "┃" },
      changedelete = { hl = "GitSignsChange", text = "┃" },
    },
  },
}
