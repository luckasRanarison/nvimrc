return {
  {
    event = { "LspAttach" },
    opts = {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local lsp = require("lsp.setup")
        lsp.setup_keymaps(client, bufnr)
        lsp.setup_autocmd(client, bufnr)
      end,
    },
  },
}
