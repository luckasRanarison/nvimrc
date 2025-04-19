vim.filetype.add({
  extension = {
    ic = "icelang",
    rasi = "rasi",
    ebnf = "ebnf",
  },
  pattern = {
    [".*%.env%..*"] = "sh",
  },
})
