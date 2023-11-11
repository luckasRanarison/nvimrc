local M = {}

local select = function(prompt, callback)
  vim.ui.select({ "tabs", "spaces" }, {
    prompt = prompt,
  }, function(choice)
    if choice then callback(choice) end
  end)
end

M.indent = function()
  select("Indent using: ", function(choice)
    if choice == "spaces" then
      vim.o.expandtab = true
    else
      vim.o.expandtab = false
    end

    vim.notify("Indentation using " .. choice)
  end)
end

return M
