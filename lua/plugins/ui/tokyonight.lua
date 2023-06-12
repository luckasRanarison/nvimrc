return {
  "fslke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  init = function() vim.cmd.colorscheme("tokyonight-night") end,
  opts = {
    styles = {
      keywords = { italic = false },
    },
    on_colors = function(colors)
      colors.gitSigns.add = colors.green
      colors.gitSigns.change = colors.blue
      colors.gitSigns.delete = colors.red
      colors.gitSigns.ignored = colors.bg
      return colors
    end,
    on_highlights = function(hl, c)
      hl.BufferLineFill = { bg = c.bg }
      hl.WinSeparator = { fg = c.bg }
      hl.DiagnosticSignError = { fg = c.red }
      hl.DiagnosticSignWarn = { fg = c.yellow }
      hl.DiagnosticSignHint = { fg = c.blue }
      hl.DiagnosticSignInfo = { fg = c.blue }
      hl.DiagnosticError = { fg = c.red }
      hl.DiagnosticWarn = { fg = c.yellow }
      hl.DiagnosticHint = { fg = c.blue }
      hl.DiagnosticInfo = { fg = c.blue }
      hl.CursorLineNr = { fg = c.blue }
      hl.Breakpoint = { fg = c.orange }
    end,
  },
}
