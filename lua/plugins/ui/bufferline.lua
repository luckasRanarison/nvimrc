local format = require("utils.icons").format

return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      diagnostics_indicator = nil,
      indicator = "none",
      offsets = {
        {
          filetype = "neo-tree",
          text = format("Folder", "NeoTree"),
          text_align = "left",
        },
      },
    },
  },
  config = function(_, opts)
    vim.opt.showtabline = 2
    require("bufferline").setup(opts)
  end,
}
