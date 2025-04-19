local icons = require("luckasranarison.utils.icons")

local diagnostic = vim.diagnostic

diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [diagnostic.severity.ERROR] = icons.error,
      [diagnostic.severity.WARN] = icons.warn,
      [diagnostic.severity.INFO] = icons.info,
      [diagnostic.severity.HINT] = icons.hint,
    },
  },
})
