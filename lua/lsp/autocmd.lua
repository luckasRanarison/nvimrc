return {
  ["textDocument/codeLens"] = {
    event = { "BufEnter", "InsertLeave" },
    group = "LspCodelensRefresh",
    opts = {
      callback = function() vim.lsp.codelens.refresh() end,
    },
  },
  ["textDocument/formatting"] = {
    event = "BufWritePost",
    group = "LspFormatting",
    opts = {
      callback = function(opts) require("lsp.formatting").async_formatting(opts.buf) end,
    },
  },
}
