local P, G, W = vim.opt, vim.g, vim.wo

G.mapleader = " "

P.fileencoding = "utf-8"
P.cmdheight = 0
P.number = true
P.relativenumber = true
P.history = 100
P.termguicolors = true
P.filetype = "on"
P.cursorline = true
P.foldenable = true
P.foldlevel = 99
P.foldlevelstart = 99
P.ignorecase = true
P.shiftwidth = 2
P.tabstop = 2
P.expandtab = true
P.wrap = false
P.writebackup = false
P.swapfile = false
P.updatetime = 200
P.fillchars = "eob: "
P.laststatus = 0
P.modeline = false
P.conceallevel = 2
P.mouse = ""

W.foldmethod = "expr"
W.foldexpr = "v:lua.vim.treesitter.foldexpr()"
