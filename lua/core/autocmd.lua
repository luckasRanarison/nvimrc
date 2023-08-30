return {
  {
    event = "LspAttach",
    opts = {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local lsp = require("lsp.utils")

        lsp.set_keymaps(client, bufnr)
        lsp.set_autocmd(client, bufnr)
      end,
    },
  },
  {
    event = { "WinEnter", "BufEnter" },
    opts = {
      group = vim.api.nvim_create_augroup("CodewindowAutoOpen", { clear = true }),
      callback = function()
        if vim.bo.buftype == "terminal" then return end

        vim.schedule(require("codewindow").open_minimap)
      end,
    },
  },
  {
    event = { "FileType" },
    opts = {
      pattern = { "help" },
      callback = function() require("utils.scripts").open_help_float() end,
    },
  },
}
