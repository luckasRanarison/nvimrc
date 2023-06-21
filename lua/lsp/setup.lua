local M = {}

M.setup_autocmd = function(client, bufnr)
  local capability_map = require("lsp.autocmd")

  for capability, map in pairs(capability_map) do
    if client.supports_method(capability) then
      if capability == "textDocument/formatting" and client.name ~= "null-ls" then return end
      vim.api.nvim_clear_autocmds({ group = map.opts.group, buffer = bufnr })
      map.opts.buffer = bufnr
      vim.api.nvim_create_autocmd(map.event, map.opts)
    end
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
end

return M
