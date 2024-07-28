local M = {}

M.leader = function(key) return "<leader>" .. key end
M.ctrl = function(key) return "<C-" .. key .. ">" end
M.alt = function(key) return "<A-" .. key .. ">" end
M.cmd = function(arg) return "<cmd>" .. arg .. "<cr>" end
M.rcmd = function(arg) return ":" .. arg .. "<cr>" end

return M
