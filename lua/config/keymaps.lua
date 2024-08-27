local mp = require "utils.mappings"
local prompt = require "modules.prompt"

local L, C, A, cmd = mp.leader, mp.ctrl, mp.alt, mp.cmd

---@param mode "n" | "i" | "t" | "v"
---@param lhs string
---@param rhs string | function
---@param desc? string
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, nowait = true })
end

map("i", "jj", "<esc>")

map("n", L "w", cmd "w", "Save file")
map("n", L "W", cmd "w!", "Save file!")
map("n", L "q", cmd "q", "Exit window")
map("n", L "Q", cmd "q!", "Exit window!")
map("n", L "%", cmd "luafile %", "Luafile")
map("n", L " ", cmd "wincmd w", "Switch window")

map("n", L "p", '"+p', "Paste from clipboard (down)")
map("n", L "P", '"+P', "Paste from clipboard (up)")

map("n", L "us", cmd "nohlsearch", "Clear search highlights")
map("n", L "ui", prompt.set_indent, "Set indentation")
map("n", L "uI", prompt.set_indent_type, "Set indentation type")
map("n", L "uf", prompt.set_filetype, "Set filetype")

map("n", C "h", cmd "wincmd h", "Move to left window")
map("n", C "j", cmd "wincmd j", "Move to bottom window")
map("n", C "k", cmd "wincmd k", "Move to top window")
map("n", C "l", cmd "wincmd l", "Move to right window")

map("n", A "i", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
map("n", A "o", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")

map("n", L "ld", vim.diagnostic.open_float, "Show diagnostics")
map("n", L "ll", vim.lsp.codelens.run, "Run codelens")
map("n", L "lL", vim.lsp.codelens.refresh, "Refresh codelens")
map("n", L "la", vim.lsp.buf.code_action, "Code actions")
map("n", L "lr", vim.lsp.buf.rename, "Rename symbol")

map("n", L "lh", vim.lsp.buf.toggle_ilay_hint, "Toggle Inlay hints")

map("v", "q", "<esc>")
map("v", L "p", '"+p', "Paste from clipboard (down)")
map("v", L "P", '"+P', "Paste from clipboard (up)")
map("v", L "y", '"+y', "Yank to clipboard")

map("t", "<esc>", [[<C-\><C-n>]])
map("t", C "h", cmd "wincmd h", "Move to left window")
map("t", C "j", cmd "wincmd j", "Move to bottom window")
map("t", C "k", cmd "wincmd k", "Move to top window")
map("t", C "l", cmd "wincmd l", "Move to right window")
