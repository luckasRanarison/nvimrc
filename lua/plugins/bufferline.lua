local MP = require "utils.mappings"

local L, cmd = MP.leader, MP.cmd

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { L "bb", cmd "BufferLinePick", desc = "Pick buffer" },
    { L "bd", cmd "BufferLinePickClose", desc = "Close buffer" },
    { L "bl", cmd "BufferLineCloseLeft", desc = "Close buffer to the left" },
    { L "br", cmd "BufferLineCloseRight", desc = "Close buffer to the right" },
    { L "bn", cmd "BufferLineCycleNext", desc = "Next buffer" },
    { L "bp", cmd "BufferLineCyclePrev", desc = "Prev buffer" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = nil,
      indicator = "none",
      offsets = {
        {
          filetype = "neo-tree",
          text = " NeoTree",
          text_align = "left",
          highlight = "Bold",
          separator = "│",
        },
      },
    },
  },
}
