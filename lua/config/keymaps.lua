local mp = require "utils.mappings"
local prompt = require "modules.prompt"
local toggle = require "modules.toggle"
local helpers = require "config.helpers"

local L, C, cmd = mp.leader, mp.ctrl, mp.cmd

local keymaps = {
  i = {
    ["jj"] = { "<esc>" },
  },
  n = {
    [L "w"] = { cmd "w", desc = "Save file" },
    [L "W"] = { cmd "w!", desc = "Save file!" },
    [L "q"] = { cmd "q", desc = "Exit window" },
    [L "Q"] = { cmd "q!", desc = "Exit window!" },
    [L "%"] = { cmd "luafile %", desc = "Luafile" },
    [L " "] = { cmd "wincmd w", desc = "Switch window" },

    [L "p"] = { '"+p', desc = "Paste from clipboard (down)" },
    [L "P"] = { '"+P', desc = "Paste from clipboard (up)" },

    [L "us"] = { cmd "nohlsearch", desc = "Clear search highlights" },
    [L "ui"] = { prompt.set_indent, desc = "Set indentation" },
    [L "uI"] = { prompt.set_indent_type, desc = "Set indentation type" },
    [L "uf"] = { prompt.set_filetype, desc = "Set filetype" },
    [L "ut"] = { toggle.switch, desc = "Toggle word" },

    [C "h"] = { cmd "wincmd h", desc = "Move to left window" },
    [C "j"] = { cmd "wincmd j", desc = "Move to bottom window" },
    [C "k"] = { cmd "wincmd k", desc = "Move to top window" },
    [C "l"] = { cmd "wincmd l", desc = "Move to right window" },
  },
  v = {
    ["q"] = { "<esc>" },
    [L "p"] = { '"+p', desc = "Paste from clipboard (down)" },
    [L "P"] = { '"+P', desc = "Paste from clipboard (up)" },
    [L "y"] = { '"+y', desc = "Yank to clipboard" },
  },
  t = {
    ["<esc>"] = { [[<C-\><C-n>]] },
    [C "h"] = { cmd "wincmd h", desc = "Move to left window" },
    [C "j"] = { cmd "wincmd j", desc = "Move to bottom window" },
    [C "k"] = { cmd "wincmd k", desc = "Move to top window" },
    [C "l"] = { cmd "wincmd l", desc = "Move to right window" },
  },
}

helpers.set_keymaps(keymaps)
