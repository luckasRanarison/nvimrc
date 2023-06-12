local M = {}

M.setup_formatting = function(client, bufnr)
  local lsp = require("lsp.formatting")
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = augroup,
      buffer = bufnr,
      callback = function() lsp.async_formatting(bufnr) end,
    })
  end
end

-- TODO: codelens support
M.setup_keymaps = function(client, bufnr)
  local keymaps = { n = {} }
  local capability_map = require("lsp.keymaps")

  for capability, maps in pairs(capability_map) do
    if client.supports_method(capability) then
      for key, value in pairs(maps) do
        keymaps.n[key] = value
      end
    end
  end

  require("utils.configurer").set_keymaps(keymaps)
end

return M
