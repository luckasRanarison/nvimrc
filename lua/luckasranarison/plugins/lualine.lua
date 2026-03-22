local comp = require("luckasranarison.plugins.modules.lualine")

local state = {
  lsp_progress = nil,
}

return {
  "nvim-lualine/lualine.nvim",
  event = { "InsertEnter", "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      always_divide_middle = false,
    },
    sections = {
      lualine_a = { comp.mode },
      lualine_b = { comp.branch, comp.diff },
      lualine_c = { comp.filetype, comp.filesize, comp.macro, { color = { bg = "NONE" } } },

      lualine_x = { comp.lsp_progress(state), comp.lsp, comp.diagnostics },
      lualine_y = { comp.indentation, comp.encoding, comp.fileformat },
      lualine_z = { comp.progress, comp.location },
    },
  },
  config = function(_, opt)
    local auto = require("lualine.themes.auto")

    local lualine_modes =
      { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
    for _, field in ipairs(lualine_modes) do
      if auto[field] and auto[field].c then auto[field].c.bg = "NONE" end
    end

    opt.options.theme = auto

    ---@diagnostic disable-next-line: different-requires
    require("lualine").setup(opt)

    vim.api.nvim_create_autocmd("LspProgress", {
      callback = function(args) state.lsp_progress = args.data end,
    })

    vim.opt.laststatus = 3
  end,
}
