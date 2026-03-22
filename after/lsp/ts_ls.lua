return {
  root_dir = function(bufnr, on_dir)
    local root_markers = {
      { "tsconfig.json", "jsconfig.json" },
      { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
      { ".git" },
    }
    local root = vim.fs.root(bufnr, root_markers)
    on_dir(root or vim.fn.getcwd())
  end,
}
