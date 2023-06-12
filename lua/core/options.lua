local options = {
  opt = {
    fileencoding = "utf-8",
    cmdheight = 0,
    number = true,
    relativenumber = true,
    undofile = true,
    history = 100,
    termguicolors = true,
    filetype = "on",
    cursorline = true,
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    ignorecase = true,
    shiftwidth = 2,
    showtabline = 0,
    tabstop = 2,
    expandtab = true,
    wrap = false,
    writebackup = false,
    laststatus = 0,
    updatetime = 200,
  },

  g = {
    mapleader = " ",
    highlighturl_enabled = true,
  },

  o = {
    timeout = true,
    timeoutlen = 200,
  },
}

return options
