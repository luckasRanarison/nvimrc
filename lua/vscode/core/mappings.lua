local mappings = {
  -- Normal mode
  n = {
    ["<leader>p"] = "\"+p", -- paste from system clipboard
    ["<leader>P"] = "\"+P", -- on the top
    ["<leader>s"] = ":nohlsearch<cr>", -- Clear seach highlighting
    ["<leader>r"] = ":registers<cr>", -- Show registers
    ["<leader>j"] = ":jumps<cr>", -- Show jumps

    -- Vscode actions
    ["<leader>c"] = "<cmd>call VSCodeNotify('editor.action.commentLine')<cr>", -- Comment line
    ["<leader>f"] = "<cmd>call VSCodeNotify('petsView.focus')<cr>", -- Focus pets
    ["<leader>o"] = "<cmd>call VSCodeNotify('outline.focus')<cr>", -- Focus outline
    ["<leader>n"] = "<cmd>call VSCodeNotify('notification.clear')<cr>", -- Focus outline
    ["<leader>t"] = "<cmd>call VSCodeNotify('workbench.action.togglePanel')<cr>", -- Toggle panel
    ["<leader>T"] = "<cmd>call VSCodeNotify('timeline.focus')<cr>", -- Focus timeline

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
    ["<leader>P"] = "\"+P", -- on the top
  },
}

return mappings
