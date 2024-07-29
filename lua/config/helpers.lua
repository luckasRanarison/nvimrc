local M = {}

M.set_options = function(options)
  for scope, values in pairs(options) do
    for key, value in pairs(values) do
      vim[scope][key] = value
    end
  end
end

M.set_keymaps = function(keymaps)
  for mode, mappings in pairs(keymaps) do
    for lhs, mapping in pairs(mappings) do
      vim.keymap.set(mode, lhs, mapping[1], { desc = mapping.desc })
    end
  end
end

M.set_lsp_keymaps = function(keymaps, client, buffer)
  for method, mappings in pairs(keymaps) do
    if client.supports_method(method) then
      for lhs, mapping in pairs(mappings) do
        vim.keymap.set("n", lhs, mapping[1], { desc = mapping.desc, buffer = buffer })
      end
    end
  end
end

return M
