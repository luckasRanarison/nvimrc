local format = require("utils.icons").format

return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("n", format("NewFile", "New file"), ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", format("Search", "Find file"), ":Telescope find_files<CR>"),
      dashboard.button("l", format("History", "Recents"), ":SessionManager load_session<CR>"),
      dashboard.button(
        "L",
        format("Restore", "Last session"),
        ":SessionManager load_last_session<CR>"
      ),
      dashboard.button("q", format("Exit", "Quit"), ":qa<CR>"),
    }
    dashboard.config.layout[1].val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })
    dashboard.config.layout[3].val = 5
    alpha.setup(dashboard.config)
  end,
}
