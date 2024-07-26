local lazyrepo = "https://github.com/folke/lazy.nvim.git"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

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
    { import = "plugins.theme" },
    { import = "plugins.editing" },
    { import = "plugins.treesitter" },
    { import = "plugins.lsp" },
    { import = "plugins.cmp" },
    { import = "plugins.gitsigns" },
    { import = "plugins.telescope" },
    { import = "plugins.bufferline" },
    { import = "plugins.ibl" },
    { import = "plugins.lualine" },
    { import = "plugins.neotree" },
    { import = "plugins.toggleterm" },
    { import = "plugins.conform" },
    { import = "plugins.dap" },
  },
})
