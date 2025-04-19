local lsp = vim.lsp

local handlers = {
  hover = lsp.buf.hover,
}

---@diagnostic disable-next-line: duplicate-set-field
lsp.buf.hover = function()
  handlers.hover({
    border = "rounded",
    max_width = 75,
  })
end

lsp.enable({
  "html",
  "lua_ls",
  "cssls",
  "jsonls",
  "pyright",
  "taplo",
  "ts_ls",
  "rust_analyzer",
  "yamlls",
})
