return {
  {
    "LspAttach",
    {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp.setup").setup_keymaps(client, bufnr)
      end,
    },
  },
  {
    { "BufReadPost", "BufNewFile", "InsertEnter" },
    {
      callback = function()
        vim.opt.laststatus = 3
        vim.opt.showtabline = 2
      end,
    },
  },
}
