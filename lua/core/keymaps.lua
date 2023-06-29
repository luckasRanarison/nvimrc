local format = require("utils.icons").format

return {
  n = {
    -- utils
    ["<leader>w"] = { value = ":w<CR>", desc = format("Save", "Save file") },
    ["<leader>q"] = { value = ":q<CR>", desc = format("Exit", "Exit window") },
    ["<leader>Q"] = { value = ":q!<CR>", desc = format("Exit", "Exit window!") },
    ["<leader>s"] = { value = ":nohlsearch<CR>", desc = format("Clear", "Clear search highlights") },
    ["<leader>p"] = { value = '"+p', desc = format("Clipboard", "Paste from clipboard") },
    ["<leader>P"] = { value = '"+P', desc = format("Clipboard", "Paste from clipboard") },
    ["<leader>G"] = { value = ":GuessIndent<CR>", desc = format("Indent", "Guess indent") },
    ["<leader>W"] = {
      value = ":lua vim.wo.wrap = not vim.wo.wrap<CR>",
      desc = format("LineWrap", "Toggle wrap"),
    },
    ["<leader>:"] = {
      value = ":lua ",
      desc = format("Lua", "Lua prompt"),
    },
    ["<leader>;"] = {
      value = ":lua require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)<CR>",
      desc = format("Comment", "Comment line"),
    },

    -- Neotree
    ["<leader>e"] = { value = ":Neotree toggle<CR>", desc = format("FileTree", "Toggle Neotree") },

    -- move.nvim
    ["<A-j>"] = { value = ":MoveLine(1)<CR>", desc = "Move line down" },
    ["<A-k>"] = { value = ":MoveLine(-1)<CR>", desc = "Move line up" },
    ["<A-h>"] = { value = ":MoveHChar(-1)<CR>", desc = "Move character left" },
    ["<A-l>"] = { value = ":MoveHChar(1)<CR>", desc = "Move character right" },

    -- ccc
    ["<leader>cp"] = { value = ":CccPick<CR>", desc = format("ColorPicker", "Pick color") },
    ["<leader>cc"] = { value = ":CccConvert<CR>", desc = format("Swap", "Convert color") },
    ["<leader>ce"] = {
      value = ":CccHighlighterEnable<CR>",
      desc = format("ColorOn", "Enable highlights"),
    },
    ["<leader>cd"] = {
      value = ":CccHighlighterDisable<CR>",
      desc = format("ColorOff", "Disable highlights"),
    },

    -- buffer utils
    ["<leader>bq"] = {
      value = ":BufDel<CR>",
      desc = format("Close", "Close current buffer"),
    },
    ["<leader>bQ"] = {
      value = ":BufDel!<CR>",
      desc = format("Close", "close current buffer!"),
    },
    ["<leader>bb"] = { value = ":BufferLinePick<CR>", desc = format("Open", "Pick to open buffer") },
    ["<leader>bd"] = {
      value = ":BufferLinePickClose<CR>",
      desc = format("Close", "Pick to close buffer"),
    },
    ["<leader>bc"] = {
      value = ":BufDelOthers<CR>",
      desc = format("CloseMultiple", "Close other buffers"),
    },
    ["<leader>bC"] = {
      value = ":BufDelAll<CR>",
      desc = format("CloseMultiple", "Close all buffers"),
    },
    ["<leader>bl"] = {
      value = ":BufferLineCloseLeft<CR>",
      desc = format("CloseMultiple", "Close buffers to the left"),
    },
    ["<leader>br"] = {
      value = ":BufferLineCloseRight<CR>",
      desc = format("CloseMultiple", "Close buffers to the right"),
    },
    ["<leader>bn"] = {
      value = ":BufferLineCycleNext<CR>",
      desc = format("NextBuffer", "Move to next buffer"),
    },
    ["<leader>bp"] = {
      value = ":BufferLineCyclePrev<CR>",
      desc = format("PrevBuffer", "Move to previous buffer"),
    },

    -- ufo
    ["<leader>uc"] = { value = ":foldclose<CR>", desc = format("FoldClose", "Close fold") },
    ["<leader>uC"] = {
      value = ":lua require('ufo').closeAllFolds()<CR>",
      desc = format("FoldClose", "Close all folds"),
    },
    ["<leader>uo"] = { value = ":foldopen<CR>", desc = format("FoldOpen", "Open fold") },
    ["<leader>uO"] = {
      value = ":lua require('ufo').openAllFolds()<CR>",
      desc = format("FoldOpen", "Open all folds"),
    },

    -- gitsigns
    ["<leader>gb"] = {
      value = ":Gitsigns toggle_current_line_blame<CR>",
      desc = format("GitDiff", "Toggle line blame"),
    },
    ["<leader>gd"] = { value = ":Gitsigns diffthis<CR>", desc = format("GitDiff", "Show diff") },
    ["<leader>gD"] = {
      value = ":Gitsigns toggle_deleted<CR>",
      desc = format("Delete", "Toggle deleted"),
    },
    ["<leader>gp"] = {
      value = ":Gitsigns preview_hunk<CR>",
      desc = format("Popup", "Preview hunk"),
    },
    ["<leader>gP"] = {
      value = ":Gitsigns preview_hunk_inline<CR>",
      desc = format("Popup", "Preview hunk inline"),
    },
    ["<leader>gn"] = {
      value = ":Gitsigns next_hunk<CR>",
      desc = format("Down", "Next hunk"),
    },
    ["<leader>gN"] = {
      value = ":Gitsigns prev_hunk<CR>",
      desc = format("Up", "Next hunk"),
    },
    ["<leader>gv"] = {
      value = ":Gitsigns select_hunk<CR>",
      desc = format("Visual", "Select hunk"),
    },

    -- toggleterm
    ["<leader>th"] = {
      value = ":ToggleTerm direction=horizontal<CR>",
      desc = format("Horizontal", "Horizontal terminal"),
    },
    ["<leader>tv"] = {
      value = ":ToggleTerm direction=vertical size=60<CR>",
      desc = format("Vertical", "Vertical terminal"),
    },
    ["<leader>tf"] = {
      value = ":ToggleTerm direction=float<CR>",
      desc = format("Window", "Floating terminal"),
    },
    ["<leader>tl"] = {
      value = ":lua require('plugins.utils.terminal').lazygit:toggle()<CR>",
      desc = format("GitBranch", "Lazygit terminal"),
    },
    ["<leader>tg"] = {
      value = ":lua require('plugins.utils.terminal').glow:toggle()<CR>",
      desc = format("Markdown", "Glow terminal"),
    },

    -- window navigation
    ["<C-h>"] = { value = ":wincmd h<CR>", desc = "Move right" },
    ["<C-j>"] = { value = ":wincmd j<CR>", desc = "Move down" },
    ["<C-k>"] = { value = ":wincmd k<CR>", desc = "Move up" },
    ["<C-l>"] = { value = ":wincmd l<CR>", desc = "Move left" },

    -- telescope
    ["<leader>ff"] = {
      value = ":Telescope find_files<CR>",
      desc = format("FileSearch", "Find file"),
    },
    ["<leader>fg"] = {
      value = ":Telescope live_grep<CR>",
      desc = format("TextSearch", "Live grep"),
    },
    ["<leader>fb"] = { value = ":Telescope buffers<CR>", desc = format("TabSearch", "Find buffer") },
    ["<leader>fh"] = { value = ":Telescope help_tags<CR>", desc = format("Help", "Find help") },
    ["<leader>fd"] = {
      value = ":Telescope diagnostics<CR>",
      desc = format("Warn", "Find diagnostic"),
    },
    ["<leader>fs"] = {
      value = ":lua require('telescope').extensions.aerial.aerial()<CR>",
      desc = format("Braces", "Find document symbol"),
    },
    ["<leader>fr"] = {
      value = ":Telescope resume<CR>",
      desc = format("Run", "Resume search"),
    },
    ["<leader>fn"] = {
      value = ":Telescope notify<CR>",
      desc = format("Notification", "Show notifications"),
    },
    ["<leader>fo"] = {
      value = ":Telescope vim_options<CR>",
      desc = format("Config", "Vim options"),
    },
    ["<leader>f:"] = {
      value = ":Telescope command_history<CR>",
      desc = format("History", "Command history"),
    },

    ["<leader>gc"] = {
      value = ":Telescope git_bcommits<CR>",
      desc = format("GitCommit", "Find branch commit"),
    },
    ["<leader>gC"] = {
      value = ":Telescope git_commits<CR>",
      desc = format("GitCommit", "Find commit"),
    },
    ["<leader>gB"] = {
      value = ":Telescope git_branches<CR>",
      desc = format("GitBranch", "Find git branch"),
    },

    -- packages
    ["<leader>L"] = { value = ":Lazy<CR>", desc = format("Package", "Plugin manager") },
    ["<leader>M"] = { value = ":Mason<CR>", desc = format("Package", "Mason") },

    -- DAP
    ["<leader>do"] = {
      value = ":lua require('dapui').open()<CR>",
      desc = format("Open", "Open debugger UI"),
    },
    ["<leader>dq"] = {
      value = ":lua require('dapui').close()<CR>",
      desc = format("Close", "Close debugger UI"),
    },
    ["<leader>dt"] = {
      value = ":lua require('dapui').toggle()<CR>",
      desc = format("Toggle", "Toggle debugger"),
    },
    ["<leader>dc"] = { value = ":DapTerminate<CR>", desc = format("Stop", "Terminate session") },
    ["<leader>dr"] = { value = ":DapRestartFrame<CR>", desc = format("Restart", "Restart frame") },
    ["<leader>db"] = {
      value = ":DapToggleBreakpoint<CR>",
      desc = format("Toggle", "Toggle breakpoint"),
    },
    ["<leader>dl"] = { value = ":DapShowLog<CR>", desc = format("DefaultFile", "Show logs") },
    ["<leader>dh"] = {
      value = ":lua require('dap.ui.widgets').hover()<CR>",
      desc = format("Popup", "Debugger hover"),
    },
    ["<F5>"] = { value = ":DapContinue<CR>", desc = "Continue session" },
    ["<F9>"] = { value = ":DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
    ["<F11>"] = { value = ":lua require('dap').step_into()<CR>", desc = "Step into" },
    ["<F23>"] = { value = ":lua require('dap').step_out()<CR>", desc = "Step out" },
    ["<F12>"] = { value = ":lua require('dap').step_over()<CR>", desc = "Step over" },

    -- telescope DAP
    ["<leader>dB"] = {
      value = ":lua require('telescope').extensions.dap.list_breakpoints()<CR>",
      desc = format("Breakpoint", "List breakpoints"),
    },
    ["<leader>dv"] = {
      value = ":lua require('telescope').extensions.dap.variables()<CR>",
      desc = format("Variable", "List variables"),
    },
    ["<leader>df"] = {
      value = ":lua require('telescope').extensions.dap.frames()<CR>",
      desc = format("Stack", "List frames"),
    },
    ["<leader>dF"] = {
      value = ":lua require('telescope').extensions.dap.configurations()<CR>",
      desc = format("Config", "List configurations"),
    },
    ["<leader>dC"] = {
      value = ":lua require('telescope').extensions.dap.commands()<CR>",
      desc = format("Command", "List commands"),
    },

    -- session-manager
    ["<leader>Ss"] = {
      value = ":SessionManager save_current_session<CR>",
      desc = format("Save", "Save session"),
    },
    ["<leader>Sl"] = {
      value = ":SessionManager load_session<CR>",
      desc = format("Restore", "Load session"),
    },
    ["<leader>SL"] = {
      value = ":SessionManager load_last_session<CR>",
      desc = format("Restore", "Load last session"),
    },
    ["<leader>Sd"] = {
      value = ":SessionManager delete_session<CR>",
      desc = format("Trash", "Delete session"),
    },
    ["<leader>SD"] = {
      value = ":SessionManager load_current_dir_session<CR>",
      desc = format("FolderClock", "Load current directory session"),
    },

    -- Twilight
    ["<leader>T"] = { value = ":Twilight<CR>", desc = format("Twilight", "Toggle twilight") },

    -- Codewindow
    ["<leader>mm"] = {
      value = ":lua require('codewindow').toggle_minimap()<CR>",
      desc = format("Toggle", "Toggle minimap"),
    },
    ["<leader>mo"] = {
      value = ":lua require('codewindow').open_minimap()<CR>",
      desc = format("Open", "Open minimap"),
    },
    ["<leader>mc"] = {
      value = ":lua require('codewindow').close_minimap()<CR>",
      desc = format("Close", "Close minimap"),
    },
    ["<leader>mf"] = {
      value = ":lua require('codewindow').toggle_focus()<CR>",
      desc = format("Popup", "Focus minimap"),
    },

    -- notify
    ["<leader>nn"] = {
      value = ":lua require('notify').dismiss()<CR>",
      desc = format("NotificationDismiss", "Dismiss notifications"),
    },
    ["<leader>nl"] = {
      value = ":Notifications<CR>",
      desc = format("NotificationLog", "Show logs"),
    },

    -- lspconfig
    ["<leader>li"] = { value = ":LspInfo<CR>", desc = format("Info", "Server info") },
    ["<leader>lI"] = { value = ":LspLog<CR>", desc = format("DefaultFile", "Server logs") },
    ["<leader>lS"] = { value = ":LspStart ", desc = format("Run", "Start server") },
    ["<leader>lq"] = { value = ":LspStop ", desc = format("Stop", "Stop server") },
    ["<leader>lR"] = { value = ":LspRestart<CR>", desc = format("Restart", "Restart server") },

    -- sniprun
    ["<leader>rr"] = { value = ":SnipRun<CR>", desc = format("Run", "Run code") },
    ["<leader>rR"] = { value = ":SnipReset<CR>", desc = format("Restart", "Reset sniprun") },
    ["<leader>ri"] = { value = ":SnipInfo<CR>", desc = format("Info", "Show info") },
    ["<leader>rq"] = { value = ":SnipClose<CR>", desc = format("Close", "Clear output") },

    -- dropbar
    ["<leader>oo"] = {
      value = ":lua require('dropbar.api').pick()<CR>",
      desc = format("Check", "Pick node"),
    },
  },
  v = {
    -- move.nvim
    ["<A-j>"] = { value = ":MoveBlock(1)<CR>", desc = "Move line down" },
    ["<A-k>"] = { value = ":MoveBlock(-1)<CR>", desc = "Move line up" },
    ["<A-h>"] = { value = ":MoveHBlock(-1)<CR>", desc = "Move character left" },
    ["<A-l>"] = { value = ":MoveHBlock(1)<CR>", desc = "Move character right" },

    -- utils

    ["q"] = { value = "<esc>" },
    ["<leader>y"] = { value = '"+y', desc = format("Clipboard", "yank to clipboard") },
    ["<leader>p"] = { value = '"+p', desc = format("Clipboard", "Paste from clipboard") },
    ["<leader>P"] = { value = '"+P', desc = format("Clipboard", "Paste from clipboard") },
    ["<leader>;"] = {
      value = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = format("Comment", "Comment selection"),
    },

    -- sniprun
    ["<leader>rr"] = { value = ":SnipRun<CR>", desc = format("Run", "Run code") },
  },

  t = {
    -- toggleterm normal mode
    ["<esc>"] = { value = [[<C-\><C-n>]], desc = "Normal mode" },

    -- window navigation
    ["<C-h>"] = { value = "<cmd>wincmd h<CR>", desc = "Move right" },
    ["<C-j>"] = { value = "<cmd>wincmd j<CR>", desc = "Move down" },
    ["<C-k>"] = { value = "<cmd>wincmd k<CR>", desc = "Move up" },
    ["<C-l>"] = { value = "<cmd>wincmd l<CR>", desc = "Move left" },
  },
}
