local M = {}

local make_float_config = function(minimal)
  local ui = vim.api.nvim_list_uis()[1]
  local width = 80
  local height = 25
  local row = (ui.height - height) * 0.4
  local col = (ui.width - width) * 0.5

  return {
    col = col,
    row = row,
    width = width,
    height = height,
    border = "rounded",
    relative = "editor",
    style = minimal and "minimal" or nil,
    zindex = 10,
  }
end

M.open_help_float = function()
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)
  local config = make_float_config(true)

  vim.api.nvim_win_set_config(win, config)
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(win),
    callback = function() vim.api.nvim_buf_delete(buf, {}) end,
  })
end

M.open_lua_win = function()
  local buf = vim.api.nvim_create_buf(true, false)
  local config = make_float_config(false)
  local temp = vim.fn.tempname()
  local win = vim.api.nvim_open_win(buf, true, config)

  vim.bo[buf].ft = "lua"
  vim.fn.writefile({}, temp)

  vim.keymap.set("n", "<leader>w", function()
    local text = vim.api.nvim_buf_get_lines(buf, 0, -1, true)
    vim.fn.writefile(text, temp)
    vim.cmd(":luafile " .. temp)
  end, { buffer = buf })

  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(win),
    callback = function()
      vim.fn.delete(temp)
      vim.api.nvim_buf_delete(buf, { force = true })
    end,
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
