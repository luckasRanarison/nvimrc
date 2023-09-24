local M = {}

local code_action = vim.lsp.buf.code_action

local quickfix_opts = {
  ["E0412"] = "Import",
  ["E0425"] = "Import",
  ["E0433"] = "Import",
}

M.apply = function(prefix)
  code_action({
    apply = true,
    filter = function(action)
      local title = vim.fn.trim(action.title)
      return vim.startswith(title, prefix)
    end,
  })
end

M.quickfix = function()
  code_action({
    apply = true,
    context = {
      only = { "quickfix" },
    },
    filter = function(action)
      local found = false
      local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
      for code, fix_message in pairs(quickfix_opts or {}) do
        for _, diagnostic in pairs(diagnostics) do
          if diagnostic.code == code then
            found = true
            local title = vim.fn.trim(action.title)
            if vim.startswith(title, fix_message) then return true end
          end
        end
      end
      return not found
    end,
  })
end

M.quickfix_next = function()
  vim.diagnostic.goto_next()
  M.quickfix()
end

M.quickfix_prev = function()
  vim.diagnostic.get_prev()
  M.quickfix()
end

M.refactor = function()
  code_action({
    apply = true,
    context = {
      only = { "refactor" },
    },
  })
end

M.source = function()
  code_action({
    apply = true,
    context = {
      only = { "source" },
    },
  })
end

return M
