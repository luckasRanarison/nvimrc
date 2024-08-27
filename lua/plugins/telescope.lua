local mp = require "utils.mappings"

local L, cmd = mp.leader, mp.cmd

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    cmd = { "Telescope" },
    keys = {
      { "gr", cmd "Telescope lsp_references", desc = "Symbol references" },
      { "gd", cmd "Telescope lsp_definitions", desc = "Symbol definitions" },
      { L "fe", cmd "Telescope file_browser path=%:p:h select_buffer=true", desc = "File browser" },
      { L "ff", cmd "Telescope find_files", desc = "Find files" },
      { L "fF", cmd "Telescope find_files hidden=true", desc = "Find all files" },
      { L "fh", cmd "Telescope help_tags", desc = "Help tags" },
      { L "fg", cmd "Telescope live_grep", desc = "Live grep" },
      { L "fb", cmd "Telescope buffers", desc = "Find buffer" },
      { L "fd", cmd "Telescope diagnostics", desc = "Find diagnostics" },
      { L "ft", cmd "Telescope treesitter", desc = "Treesitter symbols" },
      { L "fm", cmd "Telescope marks", desc = "Find marks" },
      { L "fr", cmd "Telescope resume", desc = "Resume picker" },
      { L "fR", cmd "Telescope registers", desc = "Find registers" },
      { L "fH", cmd "Telescope highlights", desc = "Highlight groups" },
      { L "fG", cmd "Telescope git_status", desc = "Git status" },
      { L "fo", cmd "Telescope vim_options", desc = "Vim options" },
      { L "fs", cmd "Telescope lsp_document_symbols", desc = "Document symbols" },
      { L "fS", cmd "Telescope lsp_workspace_symbols", desc = "Workspace symbols" },
    },
    opts = {
      defaults = {
        prompt_prefix = "",
        selection_caret = "",
      },
      extensions = {
        file_browser = {},
      },
    },
  },
}
