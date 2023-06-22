return {
  "folke/tokyonight.nvim",
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
      hl.BufferLineFill = { bg = c.bg }
      hl.BufferLineCloseButtonSelected = { fg = c.red }
      hl.NeoTreeDirectoryName = { fg = c.fg }
      hl.ToggleTerm = { fg = c.fg, bg = c.bg_dark }
      hl.LspInlayHint = { fg = c.comment }
      hl.FlashLabel = { fg = c.red, bg = c.bg }
      hl.FlashCurrent = { bg = c.fg }
      hl.DropBarSeparator = { fg = c.dark3 }
      hl.DropBarPick = { fg = c.red, bold = true, italic = true }
      hl.DropBarKind = { fg = c.fg }
      hl.DropBarIconUISeparator = { link = "DropBarSeparator" }
      hl.DropBarIconUIPickPivot = { link = "DropBarPick" }
      hl.DropBarKindArray = { link = "DropBarKind" }
      hl.DropBarKindBoolean = { link = "DropBarKind" }
      hl.DropBarKindBreakStatement = { link = "DropBarKind" }
      hl.DropBarKindCall = { link = "DropBarKind" }
      hl.DropBarKindCaseStatement = { link = "DropBarKind" }
      hl.DropBarKindClass = { link = "DropBarKind" }
      hl.DropBarKindConstant = { link = "DropBarKind" }
      hl.DropBarKindConstructor = { link = "DropBarKind" }
      hl.DropBarKindContinueStatement = { link = "DropBarKind" }
      hl.DropBarKindDeclaration = { link = "DropBarKind" }
      hl.DropBarKindDelete = { link = "DropBarKind" }
      hl.DropBarKindDoStatement = { link = "DropBarKind" }
      hl.DropBarKindElseStatement = { link = "DropBarKind" }
      hl.DropBarKindEnum = { link = "DropBarKind" }
      hl.DropBarKindEnumMember = { link = "DropBarKind" }
      hl.DropBarKindEvent = { link = "DropBarKind" }
      hl.DropBarKindField = { link = "DropBarKind" }
      hl.DropBarKindFolder = { fg = c.dark5 }
      hl.DropBarKindForStatement = { link = "DropBarKind" }
      hl.DropBarKindFunction = { link = "DropBarKind" }
      hl.DropBarKindIdentifier = { link = "DropBarKind" }
      hl.DropBarKindIfStatement = { link = "DropBarKind" }
      hl.DropBarKindInterface = { link = "DropBarKind" }
      hl.DropBarKindKeyword = { link = "DropBarKind" }
      hl.DropBarKindList = { link = "DropBarKind" }
      hl.DropBarKindMacro = { link = "DropBarKind" }
      hl.DropBarKindMarkdownH1 = { link = "DropBarKind" }
      hl.DropBarKindMarkdownH2 = { link = "DropBarKind" }
      hl.DropBarKindMarkdownH3 = { link = "DropBarKind" }
      hl.DropBarKindMarkdownH4 = { link = "DropBarKind" }
      hl.DropBarKindMarkdownH5 = { link = "DropBarKind" }
      hl.DropBarKindMarkdownH6 = { link = "DropBarKind" }
      hl.DropBarKindMethod = { link = "DropBarKind" }
      hl.DropBarKindModule = { link = "DropBarKind" }
      hl.DropBarKindNamespace = { link = "DropBarKind" }
      hl.DropBarKindNull = { link = "DropBarKind" }
      hl.DropBarKindNumber = { link = "DropBarKind" }
      hl.DropBarKindObject = { link = "DropBarKind" }
      hl.DropBarKindOperator = { link = "DropBarKind" }
      hl.DropBarKindPackage = { link = "DropBarKind" }
      hl.DropBarKindProperty = { link = "DropBarKind" }
      hl.DropBarKindReference = { link = "DropBarKind" }
      hl.DropBarKindRepeat = { link = "DropBarKind" }
      hl.DropBarKindScope = { link = "DropBarKind" }
      hl.DropBarKindSpecifier = { link = "DropBarKind" }
      hl.DropBarKindStatement = { link = "DropBarKind" }
      hl.DropBarKindString = { link = "DropBarKind" }
      hl.DropBarKindStruct = { link = "DropBarKind" }
      hl.DropBarKindSwitchStatement = { link = "DropBarKind" }
      hl.DropBarKindType = { link = "DropBarKind" }
      hl.DropBarKindTypeParameter = { link = "DropBarKind" }
      hl.DropBarKindUnit = { link = "DropBarKind" }
      hl.DropBarKindValue = { link = "DropBarKind" }
      hl.DropBarKindVariable = { link = "DropBarKind" }
      hl.DropBarKindWhileStatement = { link = "DropBarKind" }
    end,
  },
}
