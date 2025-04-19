local comp = require("luckasranarison.plugins.modules.lualine")

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
      lualine_x = { comp.lsp, comp.diagnostics },
      lualine_y = { comp.indentation, comp.encoding, comp.fileformat },
      lualine_z = { comp.progress, comp.location },
    },
  },
  config = function(_, opt)
    ---@diagnostic disable-next-line: different-requires
    require("lualine").setup(opt)

    vim.opt.laststatus = 3
  end,
}
