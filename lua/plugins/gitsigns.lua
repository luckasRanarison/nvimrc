local MP = require "utils.mappings"

local L, cmd = MP.leader, MP.cmd

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { L "gb", cmd "Gitsigns toggle_current_line_blame", desc = "Line blame" },
    { L "gd", cmd "Gitsigns diffthis", desc = "Show diff" },
    { L "gD", cmd "Gitsigns toggle_deleted", desc = "Toggle deleted" },
    { L "gn", cmd "Gitsigns next_hunk", desc = "Next hunk" },
    { L "gp", cmd "Gitsigns prev_hunk", desc = "Previous hunk" },
    { L "gr", cmd "Gitsigns reset_hunk", desc = "Reset hunk" },
    { L "gv", cmd "Gitsigns select_hunk", desc = "Select hunk" },
    { L "gh", cmd "Gitsigns preview_hunk_inline", desc = "Preview hunk" },
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      untracked = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "▎" },
      changedelete = { text = "▎" },
    },
    preview_config = {
      border = "none",
    },
  },
}
