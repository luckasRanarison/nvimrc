local M = {}

M.set_autocmd = function(client, bufnr)
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

M.set_keymaps = function(client, bufnr)
  local capability_map = require("lsp.keymaps")

  for capability, maps in pairs(capability_map) do
    if client.supports_method(capability) then
      for key, map in pairs(maps) do
        vim.api.nvim_buf_set_keymap(bufnr, "n", key, map.value, { desc = map.desc })
      end
    end
  end
end

M.format_async = function(bufnr)
  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      if
        not vim.api.nvim_buf_is_loaded(bufnr)
        or vim.api.nvim_buf_get_option(bufnr, "modified")
      then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
        vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent noautocmd update") end)
      end
    end
  )
end

return M
