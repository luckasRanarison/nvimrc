vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  })

  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  })
end
)
