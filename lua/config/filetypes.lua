---@type vim.filetype.add.filetypes
local filetypes = {
  extension = {
    ic = "icelang",
    rasi = "rasi",
    ebnf = "ebnf",
  },
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*%.env%..*"] = "sh",
  },
}

vim.filetype.add(filetypes)
