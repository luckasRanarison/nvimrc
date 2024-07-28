local MP = require "utils.mappings"
local P = require("github-theme.palette").load "github_dark_default"

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
    highlights = {
      fill = { bg = P.black.base },
      background = { bg = P.black.base },
      close_button = { bg = P.black.base },
      close_button_selected = { fg = P.red.base },
      separator = { fg = P.black.base, bg = P.black.base },
      offset_separator = { bg = P.black.base },
      pick = { bg = P.black.base },
    },
  },
}
