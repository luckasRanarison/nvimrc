local M = {}

M.indent = function()
  local value = vim.fn.input({ prompt = "Set indentation: " })
  local type = vim.bo[0].expandtab and "spaces" or "tabs"
  local parsed = tonumber(value)

  if parsed then
    vim.bo[0].shiftwidth = parsed
    vim.notify("Indentation set to " .. value .. " " .. type)
  else
    vim.notify("Invalid value", vim.log.levels.ERROR)
  end
  vim.notify("Indentation using ")
end

M.filetype = function()
  local value = vim.fn.input({ prompt = "Set filetype: " })
  vim.bo[0].filetype = value
  vim.notify("Set filetype to " .. value)
end

return M
