local M = {}

local input = function(prompt, callback)
  local value = vim.fn.input(prompt)
  if value:len() ~= 0 then callback(value) end
end

M.indent = function()
  input("Set indentation: ", function(value)
    local type = vim.bo[0].expandtab and "spaces" or "tabs"
    local parsed = tonumber(value)

    if parsed then
      vim.bo[0].shiftwidth = parsed
      vim.notify("Indentation set to " .. value .. " " .. type)
    else
      vim.notify("Invalid value", vim.log.levels.ERROR)
    end
  end)
end

M.filetype = function()
  input("Set filetype: ", function(value)
    vim.bo[0].filetype = value
    vim.notify("Filetype set to " .. value)
  end)
end

return M
