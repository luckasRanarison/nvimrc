local format = require("utils.icons").format

M = {}

M.active_lsp = function()
  local clients = vim.lsp.get_active_clients()
  local tab = {}

  if next(clients) == nil then return "" end

  for _, client in ipairs(clients) do
    table.insert(tab, client.name)
  end

  return format("Braces", table.concat(tab, ", "))
end

return M
