local map = require("utils.mappings")

return {
  n = {
    -- utils
    ["<leader>p"] = { value = '"+p' },
    ["<leader>P"] = { value = '"+P' },
    ["<leader>:"] = { value = ":lua " },

    ["<leader>us"] = { value = map.cmd("nohlsearch") },
    ["<leader>;"] = { value = map.cmd("VSCodeCommentary") },

    -- vscode actions
    ["<leader>w"] = { value = map.notify("workbench.action.files.save") },
    ["<leader>e"] = { value = map.notify("workbench.view.explorer") },
    ["<leader>bq"] = { value = map.notify("workbench.action.closeActiveEditor") },
    ["<leader>bn"] = { value = map.notify("workbench.action.nextEditorInGroup") },
    ["<leader>bp"] = { value = map.notify("workbench.action.previousEditorInGroup") },
    ["<leader>um"] = { value = map.notify("editor.action.toggleMinimap") },
    ["<leader>ff"] = { value = map.notify("workbench.action.quickOpen") },
    ["<leader>fs"] = { value = map.notify("workbench.action.gotoSymbol") },
    ["<leader>nn"] = { value = map.notify("notifications.clearAll") },
    ["<leader>nl"] = { value = map.notify("notifications.showList") },

    ["gr"] = { value = map.notify("editor.action.goToReferences") },
    ["<leader>lr"] = { value = map.notify("editor.action.rename") },

    -- move.nvim
    ["<A-j>"] = { value = map.cmd("MoveLine(1)") },
    ["<A-k>"] = { value = map.cmd("MoveLine(-1)") },
    ["<A-h>"] = { value = map.cmd("MoveHChar(-1)") },
    ["<A-l>"] = { value = map.cmd("MoveHChar(1)") },

    -- flash
    ["s"] = { value = map.lua("require('flash').jump()") },
    ["ß"] = { value = map.lua("require('flash').jump({ pattern = vim.fn.expand('<cword>') })") },
  },
  v = {
    -- utils
    ["q"] = { value = "<esc>" },
    ["<leader>y"] = { value = '"+y' },
    ["<leader>p"] = { value = '"+p' },
    ["<leader>P"] = { value = '"+P' },

    ["<leader>;"] = { value = map.cmd("VSCodeCommentary") },

    -- move.nvim
    ["<A-j>"] = { value = map.cmd_alt("MoveBlock(1)") },
    ["<A-k>"] = { value = map.cmd_alt("MoveBlock(-1)") },
    ["<A-h>"] = { value = map.cmd_alt("MoveHBlock(-1)") },
    ["<A-l>"] = { value = map.cmd_alt("MoveHBlock(1)") },
  },
  o = {
    ["o"] = { value = map.lua("require('flash').jump()") },
  },
}
