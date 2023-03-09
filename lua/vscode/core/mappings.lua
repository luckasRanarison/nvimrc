local vscode = require "utils.vscode"

local mappings = {
  -- normal mode
  n = {
    ["<leader>d"] = "\"+dd", -- cut line to system clipboard
    ["<leader>p"] = "\"+p", -- paste from system clipboard
    ["<leader>P"] = "\"+P", -- on the top
    ["<leader>s"] = ":nohlsearch<cr>", -- Clear seach highlighting
    ["<leader>r"] = ":registers<cr>", -- Show registers
    ["<leader>j"] = ":jumps<cr>", -- Show jumps
    ["<leader><leader>k"] = "m`O<Esc>``", -- add space up
    ["<leader><leader>j"] = "m`o<Esc>``", -- add space down

    -- Quick replace mappings
    ["<leader>("] = "ci(",
    ["<leader>\""] = "ci\"",
    ["<leader>'"] = "ci'",
    ["<leader>{"] = "ci{",
    ["<leader><"] = "ci<",
    ["<leader>["] = "ci[",

    -- move.nvim
    ["<A-j>"] = ":MoveLine(1)<cr>",
    ["<A-k>"] = ":MoveLine(-1)<cr>",
    ["<A-h>"] = ":MoveHChar(-1)<cr>",
    ["<A-l>"] = ":MoveHChar(1)<cr>",

    -- Vscode actions
    ["<leader>c"] = vscode.cmd("editor.action.commentLine"), -- Comment line
    ["<leader>t"] = vscode.cmd("workbench.action.togglePanel"), -- Toggle panel
    ["<leader>f"] = vscode.cmd("petsView.focus"), -- Focus pets
    ["<leader>i"] = vscode.cmd("editor.action.formatDocument"), -- format file
    ["<leader>o"] = vscode.cmd("outline.focus"), -- Focus outline
    ["<leader>T"] = vscode.cmd("timeline.focus"), -- Focus timeline
    ["<leader>n"] = vscode.cmd("notification.clear"), -- Focus outline
    ["<leader>O"] = vscode.cmd("workbench.action.files.openFile"), -- Open file
    ["<leader>K"] = vscode.cmd("workbench.action.files.openFolder"), -- Open folder
    ["<leader>R"] = vscode.cmd("workbench.action.openRecent"), -- Open recent
    ["<leader>S"] = vscode.cmd("editor.action.indentUsingSpaces"), -- Space indent
    ["<leader><Tab>"] = vscode.cmd("editor.action.indentUsingTabs") -- Tab indent
  },

  -- Visual mode
  v = {
    ["<leader>y"] = "\"+y", -- Yank to system clipboard
    ["<leader>p"] = "\"+p", -- Paste from system clipboard
    ["<leader>P"] = "\"+P", -- on the top
    ["<leader>d"] = "\"+d", -- cut selection to system clipboard

    -- move.nvim
    ["<A-j>"] = ":MoveBlock(1)<cr>",
    ["<A-k>"] = ":MoveBlock(-1)<cr>",
    ["<A-h>"] = ":MoveHBlock(-1)<cr>",
    ["<A-l>"] = ':MoveHBlock(1)<cr>',
  },
}

return mappings
