local M = {}

M.definitions = function() vim.cmd("Telescope lsp_definitions") end
M.type_definition = function() vim.lsp.buf.type_definition() end
M.declarations = function() vim.lsp.buf.declaration() end
M.implementations = function() vim.cmd("Telescope lsp_implementations") end
M.references = function() vim.cmd("Telescope lsp_references") end
M.hover = function() vim.lsp.buf.hover() end
M.rename = function() vim.lsp.buf.rename() end
M.signature_help = function() vim.lsp.buf.signature_help() end
M.symbols = function() vim.cmd("Telescope lsp_workspace_symbols") end
M.refresh_codelens = function() vim.lsp.codelens.refresh() end
M.run_codelens = function() vim.lsp.codelens.run() end
M.toggle_inlay_hint = function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0)) end

M.diagnostics = function()
  local _, win = vim.diagnostic.open_float()
  if win then
    vim.api.nvim_win_set_config(win, { border = "rounded" })
    vim.wo[win].signcolumn = "yes:1"
  end
end
M.next_diagnostic = function() vim.diagnostic.goto_next() end
M.prev_diagnostic = function() vim.diagnostic.goto_prev() end

M.format = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = vim.lsp.util.make_formatting_params({})
  local client = vim.lsp.get_clients({ name = "null-ls" })[1]

  if not client then
    vim.cmd.write()
  else
    client.request("textDocument/formatting", params, function(err, res, _, _)
      if err then vim.notify(err.message, vim.log.levels.ERROR) end
      if res then
        local offset_encoding = client.offset_encoding or "utf-16"
        vim.lsp.util.apply_text_edits(res, bufnr, offset_encoding)
        pcall(vim.diagnostic.show)
      end
      vim.cmd.write()
    end, bufnr)
  end
end

return M
