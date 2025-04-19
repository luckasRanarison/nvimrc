local M = {}

M.next = function() vim.diagnostic.jump({ count = 1 }) end
M.prev = function() vim.diagnostic.jump({ count = -1 }) end
M.open_float = function() vim.diagnostic.open_float({ border = "rounded" }) end

return M
