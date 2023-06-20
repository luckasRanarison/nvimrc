return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = { "n" }, desc = "Comment line" },
      { "gc", mode = { "v" }, desc = "Comment selection" },
    },
    opts = {},
  },

  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      autocmd = true,
    },
  },

  {
    "ojroques/nvim-bufdel",
    cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
    opts = {},
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n" }, desc = "Leap forwards" },
      { "S", mode = { "n" }, desc = "Leap backwards" },
      { "gs", mode = { "n" }, desc = "Leap from window" },
    },
    config = function() require("leap").add_default_mappings() end,
  },

  {
    "fedepujol/move.nvim",
    cmd = {
      "MoveLine",
      "MoveHChar",
      "MoveBlock",
      "MoveHBlock",
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    keys = {
      { "cs", mode = { "n" }, desc = "Change surrounding pair" },
      { "ds", mode = { "n" }, desc = "Delete surrounding pair" },
      { "ys", mode = { "n" }, desc = "Add surrounding pair" },
      { "S", mode = { "v" }, desc = "Add surrounding pair" },
    },
    config = function() require("nvim-surround").setup() end,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      provider_selector = function() return { "treesitter", "indent" } end,
    },
  },

  {
    "uga-rosa/ccc.nvim",
    cmd = {
      "CccPick",
      "CccConvert",
      "CccHighlighterEnable",
      "CccHighlighterDisable",
      "CccHighlighterToggle",
    },
  },

  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    opts = {},
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "michaelb/sniprun",
    build = "sh install.sh",
    cmd = { "SnipRun", "SnipInfo" },
    config = function()
      local colors = require("tokyonight.colors")
      require("sniprun").setup({
        snipruncolors = {
          SniprunVirtualTextOk = { bg = colors.night.bg, fg = colors.default.comment },
          SniprunVirtualTextErr = { bg = colors.night.bg, fg = colors.default.red },
        },
      })
    end,
  },
}
