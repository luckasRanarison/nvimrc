return {
  leader = function(key) return "<leader>" .. key end,
  ctrl = function(key) return "<C-" .. key .. ">" end,
  alt = function(key) return "<A-" .. key .. ">" end,
  cmd = function(arg) return "<cmd>" .. arg .. "<cr>" end,
  rcmd = function(arg) return ":" .. arg .. "<cr>" end,
  lua = function(code) return "<cmd>lua " .. code .. "<cr>" end,
}
