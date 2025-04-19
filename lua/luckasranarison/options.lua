local g, opt, wo = vim.g, vim.opt, vim.wo

g.mapleader = " "

opt.fileencoding = "utf-8"
opt.cmdheight = 0
opt.number = true
opt.relativenumber = true
opt.history = 100
opt.termguicolors = true
opt.filetype = "on"
opt.cursorline = true
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.ignorecase = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.wrap = false
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 200
opt.fillchars = "eob: "
opt.laststatus = 0
opt.modeline = false
opt.conceallevel = 2
opt.mouse = ""

wo.foldmethod = "expr"
wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.statuscolumn = " %s%=%l "
