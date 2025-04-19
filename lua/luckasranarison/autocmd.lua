local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  callback = function() vim.fn.mkdir(vim.fn.expand("<afile>:p:h"), "p") end,
})

autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank({ timeout = 300, higroup = "PmenuSel" }) end,
})
