---@type vim.diagnostic.Opts
local config = {
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
}

vim.diagnostic.config(config)

vim.fn.sign_define({
  { name = "DiagnosticSignHint", text = "", texthl = "DiagnosticHint" },
  { name = "DiagnosticSignInfo", text = "󰋽", texthl = "DiagnosticInfo" },
  { name = "DiagnosticSignWarn", text = "", texthl = "DiagnosticWarn" },
  { name = "DiagnosticSignError", text = "󰅚", texthl = "DiagnosticError" },
})
