local M = {}

local function input(prompt, callback)
  local value = vim.fn.input(prompt)
  if value:len() ~= 0 then callback(value) end
end

local function select(prompt, callback, values)
  vim.ui.select(values, {
    prompt = prompt,
  }, function(choice)
    if choice then callback(choice) end
  end)
end

M.set_filetype = function()
  input("Set filetype: ", function(value)
    vim.bo[0].filetype = value
    vim.notify("Filetype set to " .. value)
  end)
end

M.set_indent = function()
  input("Set indentation: ", function(value)
    local type = vim.bo[0].expandtab and "spaces" or "tabs"
    local parsed = tonumber(value)

    if not parsed then
      vim.notify("Invalid value", vim.log.levels.ERROR)
    else
      vim.bo[0].shiftwidth = parsed
      vim.notify("Indentation set to " .. value .. " " .. type)
    end
  end)
end

M.set_indent_type = function()
  select("Indent using", function(choice)
    vim.o.expandtab = choice == "spaces"
    vim.notify("Indentation using " .. choice)
  end, { "tabs", "spaces" })
end

return M
