local format = require("utils.icons").format

local cmd = function(name) return "<cmd>" .. name .. "<CR>" end
local lua = function(code) return "<cmd>lua " .. code .. "<CR>" end

return {
  n = {
    -- utils
    ["<leader>w"] = { value = cmd("w"), desc = format("Save", "Save file") },
    ["<leader>W"] = { value = cmd("w!"), desc = format("Save", "Save file!") },
    ["<leader>q"] = { value = cmd("q"), desc = format("Exit", "Exit window") },
    ["<leader>Q"] = { value = cmd("q!"), desc = format("Exit", "Exit window!") },
    ["<leader>s"] = { value = cmd("nohlsearch"), desc = format("Clear", "Clear search highlights") },
    ["<leader>p"] = { value = '"+p', desc = format("Clipboard", "Paste from clipboard") },
    ["<leader>P"] = { value = '"+P', desc = format("Clipboard", "Paste from clipboard") },
    ["<leader>:"] = { value = ":lua ", desc = format("Lua", "Lua prompt") },
    ["<leader>;"] = {
      value = lua(
        "require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)"
      ),
      desc = format("Comment", "Comment line"),
    },

    -- UI utils
    ["<leader>uw"] = {
      value = lua("vim.wo.wrap = not vim.wo.wrap vim.wo.linebreak = not vim.wo.linebreak"),
      desc = format("LineWrap", "Toggle wrap"),
    },
    ["<leader>um"] = {
      value = lua("require('plugins.utils.toggle').toggle_minimap_auto()"),
      desc = format("Minimap", "Toggle minimap auto"),
    },
    ["<leader>ut"] = { value = cmd("Twilight"), desc = format("Twilight", "Toggle twilight") },
    ["<leader>ug"] = { value = cmd("GuessIndent"), desc = format("Indent", "Guess indent") },
    ["<leader>ui"] = {
      value = lua("require('utils.scripts').set_indent_input()"),
      desc = format("Indent", "Set indentation"),
    },

    -- Neotree
    ["<leader>e"] = { value = cmd("Neotree toggle"), desc = format("FileTree", "Toggle Neotree") },

    -- move.nvim
    ["<A-j>"] = { value = cmd("MoveLine(1)"), desc = "Move line down" },
    ["<A-k>"] = { value = cmd("MoveLine(-1)"), desc = "Move line up" },
    ["<A-h>"] = { value = cmd("MoveHChar(-1)"), desc = "Move character left" },
    ["<A-l>"] = { value = cmd("MoveHChar(1)"), desc = "Move character right" },

    -- ccc
    ["<leader>cp"] = { value = cmd("CccPick"), desc = format("ColorPicker", "Pick color") },
    ["<leader>cc"] = { value = cmd("CccConvert"), desc = format("Swap", "Convert color") },
    ["<leader>ce"] = {
      value = cmd("CccHighlighterEnable"),
      desc = format("ColorOn", "Enable highlights"),
    },
    ["<leader>cd"] = {
      value = cmd("CccHighlighterDisable"),
      desc = format("ColorOff", "Disable highlights"),
    },

    -- buffer utils
    ["<leader>bq"] = {
      value = cmd("BufDel"),
      desc = format("Close", "Close current buffer"),
    },
    ["<leader>bQ"] = {
      value = cmd("BufDel!"),
      desc = format("Close", "close current buffer!"),
    },
    ["<leader>bb"] = { value = cmd("BufferLinePick"), desc = format("Open", "Pick to open buffer") },
    ["<leader>bd"] = {
      value = cmd("BufferLinePickClose"),
      desc = format("Close", "Pick to close buffer"),
    },
    ["<leader>bc"] = {
      value = cmd("BufDelOthers"),
      desc = format("CloseMultiple", "Close other buffers"),
    },
    ["<leader>bC"] = {
      value = cmd("BufDelAll"),
      desc = format("CloseMultiple", "Close all buffers"),
    },
    ["<leader>bl"] = {
      value = cmd("BufferLineCloseLeft"),
      desc = format("CloseMultiple", "Close buffers to the left"),
    },
    ["<leader>br"] = {
      value = cmd("BufferLineCloseRight"),
      desc = format("CloseMultiple", "Close buffers to the right"),
    },
    ["<leader>bn"] = {
      value = cmd("BufferLineCycleNext"),
      desc = format("NextBuffer", "Move to next buffer"),
    },
    ["<leader>bp"] = {
      value = cmd("BufferLineCyclePrev"),
      desc = format("PrevBuffer", "Move to previous buffer"),
    },
    ["<leader>bi"] = {
      value = cmd("BufferLineTogglePin"),
      desc = format("Pin", "Pin buffer"),
    },
    ["<leader>bg"] = {
      value = lua("require('bufferline').go_to(1)"),
      desc = format("PrevBuffer", "Move to first buffer"),
    },
    ["<leader>bG"] = {
      value = lua("require('bufferline').go_to(-1)"),
      desc = format("NextBuffer", "Move to last buffer"),
    },
    ["<leader>bv"] = {
      value = lua("require('plugins.utils.buffer').pick_to_split('vertical')"),
      desc = format("Vertical", "Vertical split"),
    },
    ["<leader>bh"] = {
      value = lua("require('plugins.utils.buffer').pick_to_split('horizontal')"),
      desc = format("Horizontal", "Horizontal split"),
    },
    ["<leader>bN"] = {
      value = lua("require('plugins.utils.buffer').move_to('right')"),
      desc = format("NextBuffer", "Move to right"),
    },
    ["<leader>bP"] = {
      value = lua("require('plugins.utils.buffer').move_to('left')"),
      desc = format("PrevBuffer", "Move to left"),
    },

    -- gitsigns
    ["<leader>gb"] = {
      value = cmd("Gitsigns toggle_current_line_blame"),
      desc = format("GitDiff", "Toggle line blame"),
    },
    ["<leader>gd"] = { value = cmd("Gitsigns diffthis"), desc = format("GitDiff", "Show diff") },
    ["<leader>gD"] = {
      value = cmd("Gitsigns toggle_deleted"),
      desc = format("Delete", "Toggle deleted"),
    },
    ["<leader>gp"] = {
      value = cmd("Gitsigns preview_hunk"),
      desc = format("Popup", "Preview hunk"),
    },
    ["<leader>gP"] = {
      value = cmd("Gitsigns preview_hunk_inline"),
      desc = format("Popup", "Preview hunk inline"),
    },
    ["<leader>gn"] = {
      value = cmd("Gitsigns next_hunk"),
      desc = format("Down", "Next hunk"),
    },
    ["<leader>gN"] = {
      value = cmd("Gitsigns prev_hunk"),
      desc = format("Up", "Previous hunk"),
    },
    ["<leader>gr"] = {
      value = cmd("Gitsigns reset_hunk"),
      desc = format("Restore", "Revert hunk"),
    },
    ["<leader>gs"] = {
      value = cmd("Gitsigns stage_hunk"),
      desc = format("Save", "Stage hunk"),
    },
    ["<leader>gv"] = {
      value = cmd("Gitsigns select_hunk"),
      desc = format("Visual", "Select hunk"),
    },
    ["<leader>gw"] = {
      value = cmd("Gitsigns toggle_word_diff"),
      desc = format("GitDiff", "Toggle word diff"),
    },

    -- toggleterm
    ["<leader>th"] = {
      value = cmd("ToggleTerm direction=horizontal"),
      desc = format("Horizontal", "Horizontal terminal"),
    },
    ["<leader>tv"] = {
      value = cmd("ToggleTerm direction=vertical size=60"),
      desc = format("Vertical", "Vertical terminal"),
    },
    ["<leader>tf"] = {
      value = cmd("ToggleTerm direction=float"),
      desc = format("Window", "Floating terminal"),
    },
    ["<leader>tl"] = {
      value = lua("require('plugins.utils.terminal').lazygit:toggle()"),
      desc = format("GitBranch", "Lazygit terminal"),
    },
    ["<leader>tg"] = {
      value = lua("require('plugins.utils.terminal').glow:toggle()"),
      desc = format("Markdown", "Glow terminal"),
    },

    -- window navigation
    ["<C-h>"] = { value = cmd("wincmd h"), desc = "Move right" },
    ["<C-j>"] = { value = cmd("wincmd j"), desc = "Move down" },
    ["<C-k>"] = { value = cmd("wincmd k"), desc = "Move up" },
    ["<C-l>"] = { value = cmd("wincmd l"), desc = "Move left" },

    -- telescope
    ["<leader>ff"] = {
      value = cmd("Telescope find_files"),
      desc = format("FileSearch", "Find file"),
    },
    ["<leader>fg"] = {
      value = cmd("Telescope live_grep"),
      desc = format("TextSearch", "Live grep"),
    },
    ["<leader>fb"] = { value = cmd("Telescope buffers"), desc = format("TabSearch", "Find buffer") },
    ["<leader>fh"] = { value = cmd("Telescope help_tags"), desc = format("Help", "Find help") },
    ["<leader>fd"] = {
      value = cmd("Telescope diagnostics"),
      desc = format("Warn", "Find diagnostic"),
    },
    ["<leader>fs"] = {
      value = lua("require('telescope').extensions.aerial.aerial()"),
      desc = format("Braces", "Find document symbol"),
    },
    ["<leader>fr"] = {
      value = cmd("Telescope resume"),
      desc = format("Run", "Resume search"),
    },
    ["<leader>fn"] = {
      value = cmd("Telescope notify"),
      desc = format("Notification", "Show notifications"),
    },
    ["<leader>fo"] = {
      value = cmd("Telescope vim_options"),
      desc = format("Config", "Vim options"),
    },
    ["<leader>f:"] = {
      value = cmd("Telescope command_history"),
      desc = format("History", "Command history"),
    },
    ["<leader>fm"] = {
      value = cmd("Telescope man_pages"),
      desc = format("Info", "Search man"),
    },

    ["<leader>gc"] = {
      value = cmd("Telescope git_bcommits"),
      desc = format("GitCommit", "Find branch commit"),
    },
    ["<leader>gC"] = {
      value = cmd("Telescope git_commits"),
      desc = format("GitCommit", "Find commit"),
    },
    ["<leader>gB"] = {
      value = cmd("Telescope git_branches"),
      desc = format("GitBranch", "Find git branch"),
    },

    -- packages
    ["<leader>L"] = { value = cmd("Lazy"), desc = format("Package", "Plugin manager") },
    ["<leader>M"] = { value = cmd("Mason"), desc = format("Package", "Mason") },

    -- DAP
    ["<leader>do"] = {
      value = lua("require('dapui').open()"),
      desc = format("Open", "Open debugger UI"),
    },
    ["<leader>dq"] = {
      value = lua("require('dapui').close()"),
      desc = format("Close", "Close debugger UI"),
    },
    ["<leader>dt"] = {
      value = lua("require('dapui').toggle()"),
      desc = format("Toggle", "Toggle debugger"),
    },
    ["<leader>dc"] = { value = cmd("DapTerminate"), desc = format("Stop", "Terminate session") },
    ["<leader>dr"] = { value = cmd("DapRestartFrame"), desc = format("Restart", "Restart frame") },
    ["<leader>db"] = {
      value = cmd("DapToggleBreakpoint"),
      desc = format("Toggle", "Toggle breakpoint"),
    },
    ["<leader>dl"] = { value = cmd("DapShowLog"), desc = format("DefaultFile", "Show logs") },
    ["<leader>dh"] = {
      value = lua("require('dap.ui.widgets').hover()"),
      desc = format("Popup", "Debugger hover"),
    },
    ["<F5>"] = { value = cmd("DapContinue"), desc = "Continue session" },
    ["<F9>"] = { value = cmd("DapToggleBreakpoint"), desc = "Toggle breakpoint" },
    ["<F11>"] = { value = lua("require('dap').step_into()"), desc = "Step into" },
    ["<F23>"] = { value = lua("require('dap').step_out()"), desc = "Step out" },
    ["<F12>"] = { value = lua("require('dap').step_over()"), desc = "Step over" },

    -- telescope DAP
    ["<leader>dB"] = {
      value = lua("require('telescope').extensions.dap.list_breakpoints()"),
      desc = format("Breakpoint", "List breakpoints"),
    },
    ["<leader>dv"] = {
      value = lua("require('telescope').extensions.dap.variables()"),
      desc = format("Variable", "List variables"),
    },
    ["<leader>df"] = {
      value = lua("require('telescope').extensions.dap.frames()"),
      desc = format("Stack", "List frames"),
    },
    ["<leader>dF"] = {
      value = lua("require('telescope').extensions.dap.configurations()"),
      desc = format("Config", "List configurations"),
    },
    ["<leader>dC"] = {
      value = lua("require('telescope').extensions.dap.commands()"),
      desc = format("Command", "List commands"),
    },

    -- session-manager
    ["<leader>Ss"] = {
      value = cmd("SessionManager save_current_session"),
      desc = format("Save", "Save session"),
    },
    ["<leader>Sl"] = {
      value = cmd("SessionManager load_session"),
      desc = format("Restore", "Load session"),
    },
    ["<leader>SL"] = {
      value = cmd("SessionManager load_last_session"),
      desc = format("Restore", "Load last session"),
    },
    ["<leader>Sd"] = {
      value = cmd("SessionManager delete_session"),
      desc = format("Trash", "Delete session"),
    },
    ["<leader>SD"] = {
      value = cmd("SessionManager load_current_dir_session"),
      desc = format("FolderClock", "Load current directory session"),
    },

    -- Codewindow
    ["<leader>mm"] = {
      value = lua("require('codewindow').toggle_minimap()"),
      desc = format("Toggle", "Toggle minimap"),
    },
    ["<leader>mo"] = {
      value = lua("require('codewindow').open_minimap()"),
      desc = format("Open", "Open minimap"),
    },
    ["<leader>mc"] = {
      value = lua("require('codewindow').close_minimap()"),
      desc = format("Close", "Close minimap"),
    },
    ["<leader>mf"] = {
      value = lua("require('codewindow').toggle_focus()"),
      desc = format("Popup", "Focus minimap"),
    },

    -- notify
    ["<leader>nn"] = {
      value = lua("require('notify').dismiss()"),
      desc = format("NotificationDismiss", "Dismiss notifications"),
    },
    ["<leader>nl"] = {
      value = cmd("Notifications"),
      desc = format("NotificationLog", "Show logs"),
    },

    -- lspconfig
    ["<leader>li"] = { value = cmd("LspInfo"), desc = format("Info", "Server info") },
    ["<leader>lI"] = { value = cmd("LspLog"), desc = format("DefaultFile", "Server logs") },
    ["<leader>lS"] = { value = ":LspStart ", desc = format("Run", "Start server") },
    ["<leader>lq"] = { value = ":LspStop ", desc = format("Stop", "Stop server") },
    ["<leader>lR"] = { value = cmd("LspRestart"), desc = format("Restart", "Restart server") },

    -- sniprun
    ["<leader>rr"] = { value = cmd("SnipRun"), desc = format("Run", "Run code") },
    ["<leader>rR"] = { value = cmd("SnipReset"), desc = format("Restart", "Reset sniprun") },
    ["<leader>ri"] = { value = cmd("SnipInfo"), desc = format("Info", "Show info") },
    ["<leader>rq"] = { value = cmd("SnipClose"), desc = format("Close", "Clear output") },

    -- dropbar
    ["<leader>oo"] = {
      value = lua("require('dropbar.api').pick()"),
      desc = format("Check", "Pick node"),
    },

    -- DbUI
    ["<leader>Dd"] = {
      value = cmd("DBUIToggle"),
      desc = format("Toggle", "Toggle DbUI"),
    },
    ["<leader>Da"] = {
      value = cmd("DBUIAddConnection"),
      desc = format("Add", "Add connection"),
    },

    -- nvim-devdocs
    ["<leader>vv"] = {
      value = cmd("DevdocsOpenFloat"),
      desc = format("BookmarkSearch", "Open in floating window"),
    },
    ["<leader>vV"] = {
      value = cmd("DevdocsOpen"),
      desc = format("BookmarkSearch", "Open in a normal buffer"),
    },
    ["<leader>vf"] = {
      value = ":DevdocsOpenFloat ",
      desc = format("BookmarkSearch", "Open documentation"),
    },
    ["<leader>vi"] = {
      value = ":DevdocsInstall ",
      desc = format("Install", "Install documentation"),
    },
    ["<leader>vu"] = {
      value = ":DevdocsUninstall ",
      desc = format("Trash", "Install documentation"),
    },
  },
  v = {
    -- move.nvim
    ["<A-j>"] = { value = cmd("MoveBlock(1)"), desc = "Move line down" },
    ["<A-k>"] = { value = cmd("MoveBlock(-1)"), desc = "Move line up" },
    ["<A-h>"] = { value = cmd("MoveHBlock(-1)"), desc = "Move character left" },
    ["<A-l>"] = { value = cmd("MoveHBlock(1)"), desc = "Move character right" },

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
    ["<leader>rr"] = { value = cmd("SnipRun"), desc = format("Run", "Run code") },
  },

  t = {
    -- toggleterm normal mode
    ["<esc>"] = { value = [[<C-\><C-n>]], desc = "Normal mode" },

    -- window navigation
    ["<C-h>"] = { value = cmd("wincmd h"), desc = "Move right" },
    ["<C-j>"] = { value = cmd("wincmd j"), desc = "Move down" },
    ["<C-k>"] = { value = cmd("wincmd k"), desc = "Move up" },
    ["<C-l>"] = { value = cmd("wincmd l"), desc = "Move left" },
  },
}
