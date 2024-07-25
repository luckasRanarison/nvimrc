local MP = require "utils.mappings"

local L, cmd = MP.leader, MP.cmd

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { L "ff", cmd "Telescope find_files", desc = "Find files" },
      { L "fF", cmd "Telescope find_files hidden=true", desc = "Find all files" },
      { L "fh", cmd "Telescope help_tags", desc = "Help tags" },
      { L "fg", cmd "Telescope live_grep", desc = "Live grep" },
      { L "fb", cmd "Telescope buffers", desc = "Find buffer" },
      { L "fd", cmd "Telescope diagnostics", desc = "Find diagnostics" },
      { L "fs", cmd "Telescope lsp_document_symbols", desc = "LSP symbols" },
      { L "fn", cmd "Telescope notify", desc = "Notifications" },
      { L "fr", cmd "Telescope resume", desc = "Resume picker" },
      { L "fH", cmd "Telescope highlights", desc = "Highlight groups" },
      { L "fG", cmd "Telescope git_status", desc = "Git status" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      defaults = {
        prompt_prefix = "",
        selection_caret = "",
      },
      extensions = {
        fzf = {},
        aerial = {},
        dap = {},
      },
    },
  },
}
