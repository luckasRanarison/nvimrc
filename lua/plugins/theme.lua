return {
  "projekt0n/github-nvim-theme",
  main = "github-theme",
  lazy = false,
  priority = 1000,
  init = function() vim.cmd.colorscheme "github_dark_default" end,
  opts = {
    options = {
      modules = {
        neotree = true,
      },
    },
    groups = {
      all = {
        NormalFloat = { link = "Normal" },
        TelescopeBorder = { link = "Comment" },
        LspInlayHint = { link = "LspCodeLens" },
        Folded = { link = "Comment" },
        NeoTreeNormal = { link = "Normal" },
        NeoTreeGitUnstaged = { link = "GitSignsUntracked" },
        NeoTreeGitUntracked = { link = "GitSignsUntracked" },
        NeoTreeGitDeleted = { link = "GitSignsDelete" },
        NeoTreeGitAdded = { link = "GitSignsAdd" },
        NeoTreeDirectoryIcon = { link = "Constant" },
        NeoTreeDotfile = { link = "Comment" },
        IlluminatedWordRead = { link = "MatchParen" },
        IlluminatedWordWrite = { link = "MatchParen" },
        IlluminatedWordText = { link = "MatchParen" },
      },
    },
  },
}
