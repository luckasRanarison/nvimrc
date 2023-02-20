local mappings = {
  -- Normal mode
  n = {
    ["<leader>p"] = "\"+p", -- paste from system clipboard
    ["<leader>s"] = ":nohlsearch<cr>", -- Clear seach highlighting
    ["<leader>r"] = ":registers<cr>", -- Show registers
    ["<leader>j"] = ":jumps<cr>", -- Show jumps
    ["<leader>é"] = "g~l", -- Toggle letter casing
    ["<leader>c"] = "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>", -- Comment line
    ["<leader>t"] = "<cmd>call VSCodeNotify('workbench.action.togglePanel')<cr>", -- Toggle panel

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

  -- Visual mode
  v = {
    ["<leader>y"] = "\"+y", -- Yank to system clipboard
    ["<leader>p"] = "\"+p", -- Paste from system clipboard
  },
}

return mappings
