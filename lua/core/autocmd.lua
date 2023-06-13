return {
  {
    "LspAttach",
    {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp.setup").setup_keymaps(client)
      end,
    },
  },
}
