vim.filetype.add({
  extension = {
    ic = "icelang",
    rasi = "rasi",
    ebnf = "ebnf",
  },
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
