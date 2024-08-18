local mp = require "utils.mappings"
local pal = require "plugins.modules.palette"

local L, cmd = mp.leader, mp.cmd

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
    highlights = {
      fill = { bg = pal.black },
      pick = { bg = pal.black },
      hint = { bg = pal.black },
      info = { bg = pal.black },
      error = { bg = pal.black },
      warning = { bg = pal.black },
      modified = { bg = pal.black },
      background = { bg = pal.black },
      close_button = { bg = pal.black },
      close_button_selected = { fg = pal.red },
      offset_separator = { bg = pal.black },
      duplicate = { bg = pal.black, bold = true },
      separator = { fg = pal.black, bg = pal.black },
      trunc_marker = { bg = pal.black },
    },
  },
}
