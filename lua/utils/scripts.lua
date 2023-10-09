local M = {}

M.set_indent_input = function()
  local value = vim.fn.input({ prompt = "Set indentation: " })
  local type = vim.bo[0].expandtab and "spaces" or "tabs"
  local parsed = tonumber(value)

  if parsed then
    vim.bo[0].shiftwidth = parsed
    vim.notify("Indentation set to " .. value .. " " .. type)
  else
    vim.notify("Invalid value", vim.log.levels.ERROR)
  end
end

M.set_indent_type = function()
  vim.ui.select({ "tabs", "spaces" }, {
    prompt = "Indent using:",
  }, function(choice)
    if choice == "spaces" then
      vim.o.expandtab = true
    else
      vim.o.expandtab = false
    end
  end)
end

M.append_semicolon = function()
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(line .. ";")
end

M.open_help_float = function()
  local ui = vim.api.nvim_list_uis()[1]
  local width = 80
  local height = 25
  local row = (ui.height - height) * 0.4
  local col = (ui.width - width) * 0.5
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)

  vim.api.nvim_win_set_config(win, {
    col = col,
    row = row,
    width = width,
    height = height,
    border = "rounded",
    relative = "editor",
    style = "minimal",
    zindex = 10,
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(win),
    callback = function() vim.api.nvim_buf_delete(buf, {}) end,
  })
end

M.diagnostics_float = function()
  local _, win = vim.diagnostic.open_float()
  if win then
    vim.api.nvim_win_set_config(win, { border = "rounded" })
    vim.wo[win].signcolumn = "yes:1"
  end
end

return M
