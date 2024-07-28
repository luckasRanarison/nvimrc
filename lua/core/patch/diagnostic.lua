vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "󰋽",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.ERROR] = "󰅚",
    },
  },
})
