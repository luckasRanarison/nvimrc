local lazyrepo = "https://github.com/folke/lazy.nvim.git"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { output, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  ui = {
    border = "rounded",
    backdrop = 100,
  },
  spec = {
    { "neovim/nvim-lspconfig" },
    { import = "luckasranarison.plugins.blink" },
    { import = "luckasranarison.plugins.bufferline" },
    { import = "luckasranarison.plugins.conform" },
    { import = "luckasranarison.plugins.colorscheme" },
    { import = "luckasranarison.plugins.dropbar" },
    { import = "luckasranarison.plugins.edit" },
    { import = "luckasranarison.plugins.fidget" },
    { import = "luckasranarison.plugins.ibl" },
    { import = "luckasranarison.plugins.gitsigns" },
    { import = "luckasranarison.plugins.mason" },
    { import = "luckasranarison.plugins.lualine" },
    { import = "luckasranarison.plugins.telescope" },
    { import = "luckasranarison.plugins.toggleterm" },
    { import = "luckasranarison.plugins.treesitter" },
  },
})
