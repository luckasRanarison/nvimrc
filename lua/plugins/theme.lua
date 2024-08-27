return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  opts = {
    groups = {
      all = {
        Folded = { link = "Comment" },
        WinBar = { link = "Normal" },
        WinBarNC = { link = "Comment" },
        NormalFloat = { link = "Normal" },
        LspInlayHint = { link = "LspCodeLens" },
        TelescopeBorder = { link = "FloatBorder" },
        TelescopePromptTitle = { fg = "palette.white" },
        TelescopePreviewTitle = { fg = "palette.white" },
        TelescopeResultsTitle = { fg = "palette.white" },
        IlluminatedWordRead = { link = "MatchParen" },
        IlluminatedWordWrite = { link = "MatchParen" },
        IlluminatedWordText = { link = "MatchParen" },
        DropBarIconUIPickPivot = { link = "BufferLinePick" },
      },
    },
  },
  config = function(_, opts)
    require("github-theme").setup(opts)
    vim.cmd.colorscheme "github_dark_default"
  end,
}
