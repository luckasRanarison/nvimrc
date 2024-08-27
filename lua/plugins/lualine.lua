local pal = require "plugins.modules.palette"
local comp = require "plugins.modules.lualine_components"

return {
  "nvim-lualine/lualine.nvim",
  event = { "InsertEnter", "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { comp.mode },
      lualine_b = { comp.branch, comp.diff },
      lualine_c = { comp.filetype, comp.filesize, comp.macro },
      lualine_x = { comp.lsp_progress, comp.lsp, comp.diagnostics },
      lualine_y = { comp.indentation, comp.encoding, comp.fileformat },
      lualine_z = { comp.progress, comp.location },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspProgress", {
      callback = function(args) comp.state.lsp_progress = args.data end,
    })

    opts.options.theme = require "lualine.themes.github_dark_default"
    opts.options.theme.normal.c.bg = pal.black
    vim.opt.laststatus = 3

    require("lualine").setup(opts)
  end,
}
