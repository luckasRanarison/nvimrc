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

M.setup_keymaps = function(client, bufnr)
  local capability_map = require("lsp.keymaps")

  for capability, maps in pairs(capability_map) do
    if client.supports_method(capability) then
      for key, map in pairs(maps) do
        vim.api.nvim_buf_set_keymap(bufnr, "n", key, map.value, { desc = map.desc })
      end
    end
  end

  if client.supports_method("textDocument/codeLens") then
    vim.api.nvim_create_augroup("LspCodeLensRefresh", { clear = false })
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
      group = "LspCodeLensRefresh",
      callback = function(arg)
        local buf = arg.buf
        local current_clients = vim.lsp.get_active_clients({ bufnr = buf })
        local clients_with_codelens = vim.tbl_filter(
          function(c) return c.supports_method("textDocument/codeLens") end,
          current_clients
        )

        if not vim.tbl_isempty(clients_with_codelens) then
          vim.lsp.codelens.refresh()
        else
          vim.api.nvim_del_augroup_by_name("LspCodeLensRefresh")
        end
      end,
    })
  end
end

return M
