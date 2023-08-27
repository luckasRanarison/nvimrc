local M = {}

local set_options = function(options)
  for prop, variables in pairs(options) do
    for key, value in pairs(variables) do
      vim[prop][key] = value
    end
  end
end

local set_keymaps = function(keymaps)
  for mode, maps in pairs(keymaps) do
    for key, map in pairs(maps) do
      vim.keymap.set(mode, key, map.value, { desc = map.desc })
    end
  end
end

local set_autocmd = function(autocmd)
  for _, cmd in ipairs(autocmd) do
    vim.api.nvim_create_autocmd(cmd.event, cmd.opts)
  end
end

local set_signs = function(signs)
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, sign)
  end
end

local init_lazy = function(spec)
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)

  local opts = {
    ui = { border = "rounded" },
    spec = { import = spec },
  }

  require("lazy").setup(opts)
end

M.setup = function(opts)
  set_options(opts.options or {})
  set_keymaps(opts.keymaps or {})
  set_autocmd(opts.autocmd or {})
  set_signs(opts.signs or {})
  init_lazy(opts.spec)
end

return M
