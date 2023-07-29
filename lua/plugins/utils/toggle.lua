local M = {}

M.toggle_minimap_auto = function()
  local autocmds = vim.api.nvim_get_autocmds({ group = "CodewindowAutoOpen" })
  local is_active = not vim.tbl_isempty(autocmds)
  local codewindow = require("codewindow")

  if is_active then
    vim.api.nvim_clear_autocmds({ group = "CodewindowAutoOpen" })
    codewindow.close_minimap()
  else
    local autocmd = require("core.autocmd")[2]
    vim.api.nvim_create_autocmd(autocmd.event, autocmd.opts)
    codewindow.open_minimap()
  end
end

return M
