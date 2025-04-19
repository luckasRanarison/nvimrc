local lsp = require("luckasranarison.utils.lsp")
local km = require("luckasranarison.utils.keymaps")
local prompt = require("luckasranarison.utils.prompt")
local diagnostics = require("luckasranarison.utils.diagnostics")

local L, C, A, cmd, map = km.L, km.C, km.A, km.cmd, km.map

map("i", "jj", "<esc>", { desc = "Quick escape" })

map("n", L("w"), cmd("w"), { desc = "Save file" })
map("n", L("W"), cmd("w!"), { desc = "Save file!" })
map("n", L("q"), cmd("q"), { desc = "Exit window" })
map("n", L("Q"), cmd("q!"), { desc = "Exit window!" })
map("n", L("%"), cmd("luafile %"), { desc = "Luafile" })
map("n", L(" "), cmd("wincmd w"), { desc = "Switch window" })

map("n", L("p"), '"+p', { desc = "Paste from clipboard (down)" })
map("n", L("P"), '"+P', { desc = "Paste from clipboard (up)" })
map("n", L("us"), cmd("nohlsearch"), { desc = "Clear search highlights" })

map("n", L("ui"), prompt.set_indent, { desc = "Set indentation" })
map("n", L("uI"), prompt.set_indent_type, { desc = "Set indentation type" })
map("n", L("uf"), prompt.set_filetype, { desc = "Set filetype" })

map("n", C("h"), cmd("wincmd h"), { desc = "Move to left window" })
map("n", C("j"), cmd("wincmd j"), { desc = "Move to bottom window" })
map("n", C("k"), cmd("wincmd k"), { desc = "Move to top window" })
map("n", C("l"), cmd("wincmd l"), { desc = "Move to right window" })

map("n", L("ld"), diagnostics.open_float, { desc = "Show diagnostics" })
map("n", A("i"), diagnostics.next, { desc = "Next diagnostics" })
map("n", A("o"), diagnostics.prev, { desc = "Prev diagnostics" })

map("n", L("ll"), vim.lsp.codelens.run, { desc = "Run codelens" })
map("n", L("lL"), vim.lsp.codelens.refresh, { desc = "Refresh codelens" })
map("n", L("la"), vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", L("lr"), vim.lsp.buf.rename, { desc = "Rename symbol" })

map("n", L("lh"), lsp.toggle_inlay_hint, { desc = "Toggle inlay hint" })

map("v", "q", "<esc>", { desc = "Exit visual mode" })
map("v", L("p"), '"+p', { desc = "Paste from clipboard (down)" })
map("v", L("P"), '"+P', { desc = "Paste from clipboard (up)" })
map("v", L("y"), '"+y', { desc = "Yank to clipboard" })

map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit insert mode" })
map("t", C("h"), cmd("wincmd h"), { desc = "Move to left window" })
map("t", C("j"), cmd("wincmd j"), { desc = "Move to bottom window" })
map("t", C("k"), cmd("wincmd k"), { desc = "Move to top window" })
map("t", C("l"), cmd("wincmd l"), { desc = "Move to right window" })
