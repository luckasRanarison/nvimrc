return {
  ["textDocument/codeLens"] = {
    event = { "BufEnter", "InsertLeave" },
    opts = {
      group = vim.api.nvim_create_augroup("LspCodelens", {}),
      callback = function() vim.lsp.codelens.refresh() end,
    },
  },
  ["textDocument/formatting"] = {
    event = "BufWritePost",
    opts = {
      group = vim.api.nvim_create_augroup("LspFormatting", {}),
      callback = function(opts) require("lsp.utils").format_async(opts.buf) end,
    },
  },
  ["textDocument/inlayHint"] = {
    event = "BufEnter",
    opts = {
      group = vim.api.nvim_create_augroup("LspInlayHint", {}),
      callback = function(opts) vim.lsp.inlay_hint(opts.buf, true) end,
    },
  },
}
