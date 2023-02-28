local mappings = {
  -- Normal mode
  n = {
    ["<leader>p"] = "\"+p", -- paste from system clipboard
    ["<leader>P"] = "\"+P", -- on the top
    ["<leader>s"] = ":nohlsearch<cr>", -- Clear seach highlighting
    ["<leader>r"] = ":registers<cr>", -- Show registers
    ["<leader>j"] = ":jumps<cr>", -- Show jumps

    -- Quick replace mappings
    ["<leader>i"] = "ciw",
    ["<leader>I"] = "ciW",
    ["<leader>("] = "ci(",
    ["<leader>\""] = "ci\"",
    ["<leader>'"] = "ci'",
    ["<leader>{"] = "ci{",
    ["<leader><"] = "ci<",
    ["<leader>["] = "ci[",
  },

  -- Insertion mode
  i = {
    ["jj"] = "<Esc>" -- Quick escape
  },

  -- Visual mode
  v = {
    ["<leader>y"] = "\"+y", -- Yank to system clipboard
    ["<leader>p"] = "\"+p", -- Paste from system clipboard
    ["<leader>P"] = "\"+P", -- on the top
  }
}

return mappings
