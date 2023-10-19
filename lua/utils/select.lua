local M = {}

M.indent = function()
  vim.ui.select({ "tabs", "spaces" }, {
    prompt = "Indent using:",
  }, function(choice)
    if choice == "spaces" then
      vim.o.expandtab = true
    else
      vim.o.expandtab = false
    end
    vim.notify("Indentation using " .. choice)
  end)
end

return M
