local plugins = {
  "fedepujol/move.nvim",

  ["ggandor/leap.nvim"] = {
    config = function()
      require("leap").add_default_mappings()
    end
  },

  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup()
    end
  }
}

return plugins
