local sources = require("plugins.utils.lualine_sources")

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    vim.opt.laststatus = 3
    require("lualine").setup(opts)
  end,
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { sources.mode },
      lualine_b = { sources.branch, sources.diff },
      lualine_c = {
        sources.filetype,
        sources.filename,
        sources.macro,
      },
      lualine_x = {
        sources.diagnostics,
        sources.lsp,
        sources.encoding,
        sources.hostname,
        sources.fileformat,
      },
      lualine_y = { sources.progress },
      lualine_z = { sources.location },
    },
  },
}
