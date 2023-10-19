local map = require("utils.mappings")
local format = require("utils.icons").format

return {
  n = {
    -- utils
    ["<leader>w"] = {
      value = map.cmd("w"),
      desc = format("Save", "Save file"),
    },
    ["<leader>W"] = {
      value = map.cmd("w!"),
      desc = format("Save", "Save file!"),
    },
    ["<leader>q"] = {
      value = map.cmd("q"),
      desc = format("Exit", "Exit window"),
    },
    ["<leader>Q"] = {
      value = map.cmd("q!"),
      desc = format("Exit", "Exit window!"),
    },
    ["<leader>p"] = {
      value = '"+p',
      desc = format("Clipboard", "Paste from clipboard"),
    },
    ["<leader>P"] = {
      value = '"+P',
      desc = format("Clipboard", "Paste from clipboard"),
    },
    ["<leader>:"] = {
      value = ":lua ",
      desc = format("Lua", "Lua prompt"),
    },
    ["<leader>%"] = {
      value = map.cmd("luafile %"),
      desc = format("Lua", "Luafile"),
    },
    ["<leader>ù"] = {
      value = map.lua("require('utils.win').open_lua_win()"),
      desc = format("Window", "Switch window"),
    },
    ["<leader>."] = {
      value = map.lua("require('utils.scripts').append_semicolon()"),
      desc = "; " .. "Append semicolon",
    },
    ["<leader>;"] = {
      value = map.lua(
        "require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)"
      ),
      desc = format("Comment", "Comment line"),
    },
    ["<leader> "] = {
      value = map.cmd("wincmd w"),
      desc = format("Window", "Switch window"),
    },

    -- UI utils
    ["<leader>uw"] = {
      value = map.lua("vim.wo.wrap = not vim.wo.wrap vim.wo.linebreak = not vim.wo.linebreak"),
      desc = format("LineWrap", "Toggle wrap"),
    },
    ["<leader>ut"] = {
      value = map.cmd("Twilight"),
      desc = format("Twilight", "Toggle twilight"),
    },
    ["<leader>ug"] = {
      value = map.cmd("GuessIndent"),
      desc = format("Indent", "Guess indent"),
    },
    ["<leader>uf"] = {
      value = map.lua("require('utils.input').filetype()"),
      desc = format("DefaultFile", "Set filetype"),
    },
    ["<leader>ui"] = {
      value = map.lua("require('utils.input').indent()"),
      desc = format("Indent", "Set indentation"),
    },
    ["<leader>uI"] = {
      value = map.lua("require('utils.select').indent()"),
      desc = format("Indent", "Set indentation type"),
    },
    ["<leader>us"] = {
      value = map.cmd("nohlsearch"),
      desc = format("Clear", "Clear search highlights"),
    },

    -- Neotree
    ["<leader>e"] = {
      value = map.cmd("Neotree toggle"),
      desc = format("FileTree", "Toggle Neotree"),
    },

    -- move.nvim
    ["<A-j>"] = {
      value = map.cmd("MoveLine(1)"),
      desc = "Move line down",
    },
    ["<A-k>"] = {
      value = map.cmd("MoveLine(-1)"),
      desc = "Move line up",
    },
    ["<A-h>"] = {
      value = map.cmd("MoveHChar(-1)"),
      desc = "Move character left",
    },
    ["<A-l>"] = {
      value = map.cmd("MoveHChar(1)"),
      desc = "Move character right",
    },

    -- ccc
    ["<leader>cp"] = {
      value = map.cmd("CccPick"),
      desc = format("ColorPicker", "Pick color"),
    },
    ["<leader>cc"] = {
      value = map.cmd("CccConvert"),
      desc = format("Swap", "Convert color"),
    },
    ["<leader>ce"] = {
      value = map.cmd("CccHighlighterEnable"),
      desc = format("ColorOn", "Enable highlights"),
    },
    ["<leader>cd"] = {
      value = map.cmd("CccHighlighterDisable"),
      desc = format("ColorOff", "Disable highlights"),
    },

    -- buffer utils
    ["<leader>bq"] = {
      value = map.cmd("BufDel"),
      desc = format("Close", "Close current buffer"),
    },
    ["<leader>bQ"] = {
      value = map.cmd("BufDel!"),
      desc = format("Close", "close current buffer!"),
    },
    ["<leader>bb"] = {
      value = map.cmd("BufferLinePick"),
      desc = format("Open", "Pick to open buffer"),
    },
    ["<leader>bd"] = {
      value = map.cmd("BufferLinePickClose"),
      desc = format("Close", "Pick to close buffer"),
    },
    ["<leader>bc"] = {
      value = map.cmd("BufDelOthers"),
      desc = format("CloseMultiple", "Close other buffers"),
    },
    ["<leader>bC"] = {
      value = map.cmd("BufDelAll"),
      desc = format("CloseMultiple", "Close all buffers"),
    },
    ["<leader>bl"] = {
      value = map.cmd("BufferLineCloseLeft"),
      desc = format("CloseMultiple", "Close buffers to the left"),
    },
    ["<leader>br"] = {
      value = map.cmd("BufferLineCloseRight"),
      desc = format("CloseMultiple", "Close buffers to the right"),
    },
    ["<leader>bn"] = {
      value = map.cmd("BufferLineCycleNext"),
      desc = format("NextBuffer", "Move to next buffer"),
    },
    ["<leader>bp"] = {
      value = map.cmd("BufferLineCyclePrev"),
      desc = format("PrevBuffer", "Move to previous buffer"),
    },
    ["<leader>bi"] = {
      value = map.cmd("BufferLineTogglePin"),
      desc = format("Pin", "Pin buffer"),
    },
    ["<leader>bg"] = {
      value = map.lua("require('bufferline').go_to(1)"),
      desc = format("PrevBuffer", "Move to first buffer"),
    },
    ["<leader>bG"] = {
      value = map.lua("require('bufferline').go_to(-1)"),
      desc = format("NextBuffer", "Move to last buffer"),
    },
    ["<leader>bv"] = {
      value = map.lua("require('plugins.utils.buffer').pick_to_split('vertical')"),
      desc = format("Vertical", "Vertical split"),
    },
    ["<leader>bh"] = {
      value = map.lua("require('plugins.utils.buffer').pick_to_split('horizontal')"),
      desc = format("Horizontal", "Horizontal split"),
    },
    ["<leader>bN"] = {
      value = map.lua("require('plugins.utils.buffer').move_to('right')"),
      desc = format("NextBuffer", "Move to right"),
    },
    ["<leader>bP"] = {
      value = map.lua("require('plugins.utils.buffer').move_to('left')"),
      desc = format("PrevBuffer", "Move to left"),
    },

    -- gitsigns
    ["<leader>gb"] = {
      value = map.cmd("Gitsigns toggle_current_line_blame"),
      desc = format("GitDiff", "Toggle line blame"),
    },
    ["<leader>gd"] = {
      value = map.cmd("Gitsigns diffthis"),
      desc = format("GitDiff", "Show diff"),
    },
    ["<leader>gD"] = {
      value = map.cmd("Gitsigns toggle_deleted"),
      desc = format("DiffRemoved", "Toggle deleted"),
    },
    ["<leader>gp"] = {
      value = map.cmd("Gitsigns preview_hunk"),
      desc = format("Popup", "Preview hunk"),
    },
    ["<leader>gP"] = {
      value = map.cmd("Gitsigns preview_hunk_inline"),
      desc = format("Popup", "Preview hunk inline"),
    },
    ["<leader>gn"] = {
      value = map.cmd("Gitsigns next_hunk"),
      desc = format("Down", "Next hunk"),
    },
    ["<leader>gN"] = {
      value = map.cmd("Gitsigns prev_hunk"),
      desc = format("Up", "Previous hunk"),
    },
    ["<leader>gr"] = {
      value = map.cmd("Gitsigns reset_hunk"),
      desc = format("Restore", "Revert hunk"),
    },
    ["<leader>gs"] = {
      value = map.cmd("Gitsigns stage_hunk"),
      desc = format("Save", "Stage hunk"),
    },
    ["<leader>gv"] = {
      value = map.cmd("Gitsigns select_hunk"),
      desc = format("Visual", "Select hunk"),
    },
    ["<leader>gw"] = {
      value = map.cmd("Gitsigns toggle_word_diff"),
      desc = format("GitDiff", "Toggle word diff"),
    },
    ["<leader>gg"] = {
      value = map.cmd("Telescope git_status"),
      desc = format("Git", "Git status"),
    },

    -- toggleterm
    ["<leader>th"] = {
      value = map.cmd("ToggleTerm direction=horizontal"),
      desc = format("Horizontal", "Horizontal terminal"),
    },
    ["<leader>tv"] = {
      value = map.cmd("ToggleTerm direction=vertical size=60"),
      desc = format("Vertical", "Vertical terminal"),
    },
    ["<leader>tf"] = {
      value = map.cmd("ToggleTerm direction=float"),
      desc = format("Window", "Floating terminal"),
    },
    ["<leader>tl"] = {
      value = map.lua("require('plugins.utils.terminal').lazygit:toggle()"),
      desc = format("GitBranch", "Lazygit terminal"),
    },
    ["<leader>tg"] = {
      value = map.lua("require('plugins.utils.terminal').glow:toggle()"),
      desc = format("Markdown", "Glow terminal"),
    },

    -- wincmd
    ["<C-h>"] = {
      value = map.cmd("wincmd h"),
      desc = "Move right",
    },
    ["<C-j>"] = {
      value = map.cmd("wincmd j"),
      desc = "Move down",
    },
    ["<C-k>"] = {
      value = map.cmd("wincmd k"),
      desc = "Move up",
    },
    ["<C-l>"] = {
      value = map.cmd("wincmd l"),
      desc = "Move left",
    },

    -- telescope
    ["<leader>ff"] = {
      value = map.cmd("Telescope find_files"),
      desc = format("FileSearch", "Find file"),
    },
    ["<leader>fF"] = {
      value = map.cmd("Telescope find_files hidden=true"),
      desc = format("FileSearch", "Find file (hidden)"),
    },
    ["<leader>fg"] = {
      value = map.cmd("Telescope live_grep"),
      desc = format("TextSearch", "Live grep"),
    },
    ["<leader>fb"] = {
      value = map.cmd("Telescope buffers"),
      desc = format("TabSearch", "Find buffer"),
    },
    ["<leader>fh"] = {
      value = map.cmd("Telescope help_tags"),
      desc = format("Help", "Find help"),
    },
    ["<leader>fd"] = {
      value = map.cmd("Telescope diagnostics"),
      desc = format("Warn", "Find diagnostic"),
    },
    ["<leader>fs"] = {
      value = map.cmd("Telescope lsp_document_symbols"),
      desc = format("Braces", "Find document symbol"),
    },
    ["<leader>fr"] = {
      value = map.cmd("Telescope resume"),
      desc = format("Run", "Resume search"),
    },
    ["<leader>fn"] = {
      value = map.cmd("Telescope notify"),
      desc = format("Notification", "Show notifications"),
    },
    ["<leader>fo"] = {
      value = map.cmd("Telescope vim_options"),
      desc = format("Config", "Vim options"),
    },
    ["<leader>f:"] = {
      value = map.cmd("Telescope command_history"),
      desc = format("History", "Command history"),
    },
    ["<leader>fm"] = {
      value = map.cmd("Telescope man_pages"),
      desc = format("Info", "Search man"),
    },
    ["<leader>fR"] = {
      value = map.cmd("Telescope reloader"),
      desc = format("Restore", "Reload module"),
    },
    ["<leader>fH"] = {
      value = map.cmd("Telescope highlights"),
      desc = format("Color", "Highlight group"),
    },
    ["<leader>ft"] = {
      value = map.cmd("Telescope treesitter"),
      desc = format("Symbol", "Treesitter"),
    },
    ["<leader>fz"] = {
      value = map.cmd("Telescope current_buffer_fuzzy_find"),
      desc = format("Search", "Buffer fuzzy find"),
    },
    ["<leader>fp"] = {
      value = map.cmd("Telescope registers"),
      desc = format("Clipboard", "Registers"),
    },
    ["<leader>fq"] = {
      value = map.cmd("Telescope quickfix"),
      desc = format("Fix", "Quickfix"),
    },

    ["<leader>gc"] = {
      value = map.cmd("Telescope git_bcommits"),
      desc = format("GitCommit", "Find branch commit"),
    },
    ["<leader>gC"] = {
      value = map.cmd("Telescope git_commits"),
      desc = format("GitCommit", "Find commit"),
    },
    ["<leader>gB"] = {
      value = map.cmd("Telescope git_branches"),
      desc = format("GitBranch", "Find git branch"),
    },

    -- Lazy
    ["<leader>L"] = {
      value = map.cmd("Lazy"),
      desc = format("Package", "Plugin manager"),
    },

    -- Mason
    ["<leader>M"] = {
      value = map.cmd("Mason"),
      desc = format("Package", "Mason"),
    },

    -- DAP
    ["<leader>do"] = {
      value = map.lua("require('neo-tree').close_all() require('dapui').open()"),
      desc = format("Open", "Open debugger UI"),
    },
    ["<leader>dq"] = {
      value = map.lua("require('neo-tree').show() require('dapui').close()"),
      desc = format("Close", "Close debugger UI"),
    },
    ["<leader>dt"] = {
      value = map.lua("require('dapui').toggle()"),
      desc = format("Toggle", "Toggle debugger"),
    },
    ["<leader>dc"] = {
      value = map.cmd("DapTerminate"),
      desc = format("Stop", "Terminate session"),
    },
    ["<leader>dr"] = {
      value = map.cmd("DapRestartFrame"),
      desc = format("Restart", "Restart frame"),
    },
    ["<leader>db"] = {
      value = map.cmd("DapToggleBreakpoint"),
      desc = format("Toggle", "Toggle breakpoint"),
    },
    ["<leader>dl"] = {
      value = map.cmd("DapShowLog"),
      desc = format("DefaultFile", "Show logs"),
    },
    ["<leader>dh"] = {
      value = map.lua("require('dap.ui.widgets').hover()"),
      desc = format("Popup", "Debugger hover"),
    },
    ["<F5>"] = {
      value = map.cmd("DapContinue"),
      desc = "Continue session",
    },
    ["<F9>"] = {
      value = map.cmd("DapToggleBreakpoint"),
      desc = "Toggle breakpoint",
    },
    ["<F11>"] = {
      value = map.lua("require('dap').step_into()"),
      desc = "Step into",
    },
    ["<F23>"] = {
      value = map.lua("require('dap').step_out()"),
      desc = "Step out",
    },
    ["<F12>"] = {
      value = map.lua("require('dap').step_over()"),
      desc = "Step over",
    },

    -- telescope DAP
    ["<leader>dB"] = {
      value = map.lua("require('telescope').extensions.dap.list_breakpoints()"),
      desc = format("Breakpoint", "List breakpoints"),
    },
    ["<leader>dv"] = {
      value = map.lua("require('telescope').extensions.dap.variables()"),
      desc = format("Variable", "List variables"),
    },
    ["<leader>df"] = {
      value = map.lua("require('telescope').extensions.dap.frames()"),
      desc = format("Stack", "List frames"),
    },
    ["<leader>dF"] = {
      value = map.lua("require('telescope').extensions.dap.configurations()"),
      desc = format("Config", "List configurations"),
    },
    ["<leader>dC"] = {
      value = map.lua("require('telescope').extensions.dap.commands()"),
      desc = format("Command", "List commands"),
    },

    -- session-manager
    ["<leader>Ss"] = {
      value = map.cmd("SessionManager save_current_session"),
      desc = format("Save", "Save session"),
    },
    ["<leader>Sl"] = {
      value = map.cmd("SessionManager load_session"),
      desc = format("Restore", "Load session"),
    },
    ["<leader>SL"] = {
      value = map.cmd("SessionManager load_last_session"),
      desc = format("Restore", "Load last session"),
    },
    ["<leader>Sd"] = {
      value = map.cmd("SessionManager delete_session"),
      desc = format("Trash", "Delete session"),
    },
    ["<leader>SD"] = {
      value = map.cmd("SessionManager load_current_dir_session"),
      desc = format("FolderClock", "Load current directory session"),
    },

    -- notify
    ["<leader>nn"] = {
      value = map.lua("require('notify').dismiss()"),
      desc = format("NotificationDismiss", "Dismiss notifications"),
    },
    ["<leader>nl"] = {
      value = map.cmd("Notifications"),
      desc = format("NotificationLog", "Show logs"),
    },

    -- lspconfig
    ["<leader>li"] = {
      value = map.cmd("LspInfo"),
      desc = format("Info", "Server info"),
    },
    ["<leader>lI"] = {
      value = map.cmd("LspLog"),
      desc = format("DefaultFile", "Server logs"),
    },
    ["<leader>lS"] = {
      value = ":LspStart ",
      desc = format("Run", "Start server"),
    },
    ["<leader>lq"] = {
      value = ":LspStop ",
      desc = format("Stop", "Stop server"),
    },
    ["<leader>lR"] = {
      value = map.cmd("LspRestart"),
      desc = format("Restart", "Restart server"),
    },

    -- dropbar
    ["<leader>oo"] = {
      value = map.lua("require('dropbar.api').pick()"),
      desc = format("Check", "Pick node"),
    },

    -- DbUI
    ["<leader>Dd"] = {
      value = map.cmd("DBUIToggle"),
      desc = format("Toggle", "Toggle DbUI"),
    },
    ["<leader>Da"] = {
      value = map.cmd("DBUIAddConnection"),
      desc = format("Add", "Add connection"),
    },

    -- nvim-devdocs
    ["<leader>vv"] = {
      value = map.cmd("DevdocsOpenFloat"),
      desc = format("BookmarkSearch", "Open in floating window"),
    },
    ["<leader>vV"] = {
      value = map.cmd("DevdocsOpen"),
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

    -- crates
    ["<leader>Cv"] = {
      value = map.lua("require('crates').show_versions_popup()"),
      desc = format("Info", "Show versions popup"),
    },
    ["<leader>Cf"] = {
      value = map.lua("require('crates').show_features_popup()"),
      desc = format("Stack", "Show features popup"),
    },
    ["<leader>Cd"] = {
      value = map.lua("require('crates').show_dependencies_popup()"),
      desc = format("Dependencies", "Show dependencies popup"),
    },
    ["<leader>Cu"] = {
      value = map.lua("require('crates').update_crate()"),
      desc = format("Update", "Update crate"),
    },
    ["<leader>CU"] = {
      value = map.lua("require('crates').update_all_crates()"),
      desc = format("Update", "Update all crates"),
    },
    ["<leader>CD"] = {
      value = map.lua("require('crates').open_documentation()"),
      desc = format("DefaultFile", "Open documentation"),
    },
    ["<leader>Ch"] = {
      value = map.lua("require('crates').open_homepage()"),
      desc = format("Web", "Open homepage"),
    },
    ["<leader>Cc"] = {
      value = map.lua("require('crates').open_crates_io()"),
      desc = format("Package", "Open crates.io"),
    },
    ["<leader>Cr"] = {
      value = map.lua("require('crates').open_repository()"),
      desc = format("Github", "Open repository"),
    },
  },
  v = {
    -- move.nvim
    ["<A-k>"] = {
      value = map.cmd_alt("MoveBlock(-1)"),
      desc = "Move line up",
    },
    ["<A-j>"] = {
      value = map.cmd_alt("MoveBlock(1)"),
      desc = "Move line down",
    },
    ["<A-h>"] = {
      value = map.cmd_alt("MoveHBlock(-1)"),
      desc = "Move character left",
    },
    ["<A-l>"] = {
      value = map.cmd_alt("MoveHBlock(1)"),
      desc = "Move character right",
    },

    -- utils
    ["q"] = { value = "<esc>" },
    ["<leader>y"] = {
      value = '"+y',
      desc = format("Clipboard", "yank to clipboard"),
    },
    ["<leader>p"] = {
      value = '"+p',
      desc = format("Clipboard", "Paste from clipboard"),
    },
    ["<leader>P"] = {
      value = '"+P',
      desc = format("Clipboard", "Paste from clipboard"),
    },
    ["<leader>;"] = {
      value = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = format("Comment", "Comment selection"),
    },

    -- gitsigns
    ["<leader>gr"] = {
      value = map.cmd("Gitsigns reset_hunk"),
      desc = format("Restore", "Revert hunk"),
    },

    -- crates
    ["<leader>Cu"] = {
      value = map.lua("require('crates').update_crates()"),
      desc = format("Update", "Update crates"),
    },
  },

  t = {
    -- toggleterm
    ["<esc>"] = { value = [[<C-\><C-n>]] },

    -- wincmd
    ["<C-h>"] = {
      value = map.cmd("wincmd h"),
      desc = "Move right",
    },
    ["<C-j>"] = {
      value = map.cmd("wincmd j"),
      desc = "Move down",
    },
    ["<C-k>"] = {
      value = map.cmd("wincmd k"),
      desc = "Move up",
    },
    ["<C-l>"] = {
      value = map.cmd("wincmd l"),
      desc = "Move left",
    },
  },
}
