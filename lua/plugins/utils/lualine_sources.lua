local format = require("utils.icons").format

M = {}

M.active_lsp = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

  if next(clients) == nil then return "" end

  local attached_clients = vim.tbl_map(function(client) return client.name end, clients)

  return format("Braces", table.concat(attached_clients, ", "))
end

return M
