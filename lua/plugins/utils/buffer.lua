local M = {}

local bufferline = require("bufferline")
local choose_then = require("bufferline.pick").choose_then

---@param direction "horizontal" | "vertical"
M.pick_to_split = function(direction)
  choose_then(function(id)
    local name = vim.api.nvim_buf_get_name(id)
    local cmd = direction == "vertical" and "vsp" or "sp"
    vim.cmd(cmd .. name)
    vim.cmd("wincmd x")
    vim.cmd("wincmd w")
  end)
end

---@param direction "left" | "right"
M.move_to = function(direction)
  local bufnr = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  local active_buffers = vim.tbl_filter(
    function(buf) return vim.api.nvim_buf_is_loaded(buf) end,
    buffers
  )

  for idx, buf in ipairs(active_buffers) do
    if buf == bufnr then
      local pos = direction == "left" and idx or idx + 1
      bufferline.move_to(pos)
      break
    end
  end
end

return M
