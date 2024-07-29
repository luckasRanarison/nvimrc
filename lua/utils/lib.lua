local M = {}

M.tbl_double_lookup = function(pairs_table)
  local lookup_table = {}

  for _, value in pairs(pairs_table) do
    lookup_table[value[1]] = value[2]
    lookup_table[value[2]] = value[1]
  end

  return lookup_table
end

M.input = function(prompt, callback)
  local value = vim.fn.input(prompt)
  if value:len() ~= 0 then callback(value) end
end

M.select = function(prompt, callback, values)
  vim.ui.select(values, {
    prompt = prompt,
  }, function(choice)
    if choice then callback(choice) end
  end)
end

return M
