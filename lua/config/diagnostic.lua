vim.diagnostic.config({
  float = {
    border = "rounded",
    header = " Diagnostics: ",
    prefix = function(_, i) return " " .. i .. " - ", "" end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "󰋽",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.ERROR] = "󰅚",
    },
  },
})
