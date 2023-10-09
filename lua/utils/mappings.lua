local M = {}

M.cmd = function(cmd) return "<cmd>" .. cmd .. "<CR>" end
M.cmd_alt = function(cmd) return ":" .. cmd .. "<CR>" end
M.lua = function(cmd) return "<cmd>lua " .. cmd .. "<CR>" end
M.notify = function(cmd) return M.cmd("call VSCodeNotify('" .. cmd .. "')") end

return M
