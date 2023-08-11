return {
  -- "luckasRanarison/nvim-devdocs",
  dir = "~/Projects/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "DevdocsFetch",
    "DevdocsInstall",
    "DevdocsUninstall",
    "DevdocsOpen",
    "DevdocsOpenFloat",
    "DevdocsUpdate",
    "DevdocsUpdateAll",
  },
  opts = {
    ensure_installed = {
      "git",
      "bash",
      "rust",
      "lua-5.4",
      "html",
      "css",
      "javascript",
      "typescript",
      "react",
      "web_extensions",
    },
    wrap = true,
  },
}
