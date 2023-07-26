local M = {}

M.set_autocmd = function(client, bufnr)
  local capability_map = require("lsp.autocmd")

  for capability, map in pairs(capability_map) do
    if client.supports_method(capability) then
      if not (capability == "textDocument/formatting" and client.name ~= "null-ls") then
        vim.api.nvim_clear_autocmds({ group = map.opts.group, buffer = bufnr })
        map.opts.buffer = bufnr
        vim.api.nvim_create_autocmd(map.event, map.opts)
      end
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
  local handler = function(err, res, ctx)
    if err then
      local err_msg = type(err) == "string" and err or err.message
      vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
      return
    end

    local is_loaded = vim.api.nvim_buf_is_loaded(bufnr)
    local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

    if not is_loaded or is_modified then return end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local offset_encoding = client and client.offset_encoding or "utf-16"
      vim.lsp.util.apply_text_edits(res, bufnr, offset_encoding)
      vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent noautocmd update") end)
    end
  end

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params({}),
    handler
  )
end

return M
