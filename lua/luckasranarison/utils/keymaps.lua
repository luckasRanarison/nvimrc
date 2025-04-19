local M = {}

M.L = function(key) return "<leader>" .. key end
M.C = function(key) return "<C-" .. key .. ">" end
M.A = function(key) return "<A-" .. key .. ">" end
M.cmd = function(arg) return "<cmd>" .. arg .. "<cr>" end
M.rcmd = function(arg) return ":" .. arg .. "<cr>" end

---@param mode "i" | "n" | "v" | "t"
---@param lhs string
---@param rhs string | function
---@param opts? vim.keymap.set.Opts
M.map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("error", opts or {}, { nowait = true }))
end

return M
