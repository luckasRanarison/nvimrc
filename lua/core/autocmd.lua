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
    event = { "VimEnter" },
    opts = { command = "silent !tmux set status off" },
  },
  {
    event = { "VimLeave" },
    opts = { command = "silent !tmux set status on" },
  },
  {
    event = { "BufEnter" },
    opts = { command = "TwilightEnable" },
  },
  {
    event = { "FileType" },
    opts = {
      pattern = { "help" },
      callback = require("utils.scripts").open_help_float,
    },
  },
}
