local helpers = require "config.helpers"

local options = {
  g = {
    mapleader = " ",
  },
  opt = {
    fileencoding = "utf-8",
    cmdheight = 0,
    number = true,
    relativenumber = true,
    history = 100,
    termguicolors = true,
    filetype = "on",
    cursorline = true,
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    ignorecase = true,
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
    wrap = false,
    writebackup = false,
    swapfile = false,
    updatetime = 200,
    fillchars = "eob: ",
    laststatus = 0,
    modeline = false,
    conceallevel = 2,
    mouse = "",
  },
  wo = {
    foldmethod = "expr",
    foldexpr = "v:lua.vim.treesitter.foldexpr()",
  },
}

helpers.set_options(options)
