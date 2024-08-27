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
        TelescopeBorder = { link = "Comment" },
        LspInlayHint = { link = "LspCodeLens" },
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
