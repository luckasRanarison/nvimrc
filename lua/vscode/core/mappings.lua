local mappings = {
  -- Normal mode
  n = {
    ["<leader>p"] = "\"+p", -- paste from system clipboard
    ["<leader>s"] = ":nohlsearch<cr>", -- CLear seach highlighting
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

for mode, maps in pairs(mappings) do
  for key, map in pairs(maps) do
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, key, map, opts)
  end
end
