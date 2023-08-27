local cmd = function(name) return "<cmd>" .. name .. "<CR>" end
local lua = function(code) return "<cmd>lua " .. code .. "<CR>" end
local notify = function(vscode_cmd) return cmd("call VSCodeNotify('" .. vscode_cmd .. "')") end

return {
  n = {
    ["<leader>p"] = { value = '"+p' },
    ["<leader>P"] = { value = '"+P' },
    ["<leader>:"] = { value = ":lua " },

    ["<leader>s"] = { value = cmd("nohlsearch") },
    ["<leader>;"] = { value = cmd("VSCodeCommentary") },

    ["<leader>w"] = { value = notify("workbench.action.files.save") },
    ["<leader>e"] = { value = notify("workbench.view.explorer") },
    ["<leader>bq"] = { value = notify("workbench.action.closeActiveEditor") },
    ["<leader>bn"] = { value = notify("workbench.action.nextEditorInGroup") },
    ["<leader>bp"] = { value = notify("workbench.action.previousEditorInGroup") },
    ["<leader>um"] = { value = notify("editor.action.toggleMinimap") },
    ["<leader>nn"] = { value = notify("notifications.clearAll") },
    ["<leader>nl"] = { value = notify("notifications.showList") },

    ["gr"] = { value = notify("editor.action.goToReferences") },
    ["<leader>lr"] = { value = notify("editor.action.rename") },

    -- move.nvim
    ["<A-j>"] = { value = cmd("MoveLine(1)") },
    ["<A-k>"] = { value = cmd("MoveLine(-1)") },
    ["<A-h>"] = { value = cmd("MoveHChar(-1)") },
    ["<A-l>"] = { value = cmd("MoveHChar(1)") },

    -- flash
    ["s"] = { value = lua("require('flash').jump()") },
    ["ß"] = { value = lua("require('flash').jump({ pattern = vim.fn.expand('<cword>') })") },
  },
  v = {
    ["q"] = { value = "<esc>" },
    ["<leader>y"] = { value = '"+y' },
    ["<leader>p"] = { value = '"+p' },
    ["<leader>P"] = { value = '"+P' },

    ["<leader>;"] = { value = cmd("VSCodeCommentary") },

    -- move.nvim
    ["<A-j>"] = { value = cmd("MoveBlock(1)") },
    ["<A-k>"] = { value = cmd("MoveBlock(-1)") },
    ["<A-h>"] = { value = cmd("MoveHBlock(-1)") },
    ["<A-l>"] = { value = cmd("MoveHBlock(1)") },
  },
  o = {
    ["o"] = { value = lua("require('flash').jump()") },
  },
}
