return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  main = "github-theme",
  opts = {
    groups = {
      all = {
        Folded = { link = "Comment" },
        WinBar = { link = "Normal" },
        WinBarNC = { link = "Comment" },
        LspInlayHint = { link = "LspCodeLens" },
        Pmenu = { link = "Normal" },
        PmenuKind = { bg = nil },
        NormalFloat = { link = "Normal" },
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
        BlinkCmpDocBorder = { link = "FloatBorder" },
        TelescopeBorder = { link = "Comment" },
        IlluminatedWordRead = { link = "PmenuSel" },
        IlluminatedWordWrite = { link = "PmenuSel" },
        IlluminatedWordText = { link = "PmenuSel" },
      },
    },
  },
}
