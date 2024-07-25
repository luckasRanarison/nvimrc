local MP = require "utils.mappings"

local L, lua = MP.leader, MP.lua

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = {
    { L "nn", lua "require('notify').dismiss()", desc = "Dismiss notifications" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    { "rcarriga/nvim-notify" },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        silent = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = "rounded",
    },
  },
}
