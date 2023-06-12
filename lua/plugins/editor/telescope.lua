return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      {
        "stevearc/aerial.nvim",
        opts = {
          backends = { "treesitter" },
        },
      },
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("fzf")
      telescope.load_extension("aerial")
      telescope.load_extension("dap")
    end,
    opts = {},
  },
}
