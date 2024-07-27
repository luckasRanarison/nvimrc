vim.filetype.add({
  extension = {
    ic = "icelang",
    rasi = "rasi",
    ebnf = "ebnf",
  },
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "󰋽",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.ERROR] = "󰅚",
    },
  },
})

---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(items, opts, callback)
  local actions = require "telescope.actions"
  local config = require("telescope.themes").get_dropdown()

  config.layout_config.width = 50

  local attach_mappings = function()
    actions.select_default:replace(function(prompt_bufnr)
      local selection = require("telescope.actions.state").get_selected_entry()
      if not selection then return end
      actions.close(prompt_bufnr)
      callback(selection.value, selection.index)
    end)
    return true
  end

  require("telescope.pickers")
    .new(config, {
      prompt_title = opts.prompt,
      finder = require("telescope.finders").new_table({
        results = items,
        entry_maker = function(entry)
          local display = opts.format_item and opts.format_item(entry) or entry
          return { value = entry, display = display, ordinal = display }
        end,
      }),
      attach_mappings = attach_mappings,
    })
    :find()
end

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

local lsp = vim.lsp
local ms = lsp.protocol.Methods

lsp.handlers[ms.textDocument_hover] = lsp.with(lsp.handlers.hover, { border = "rounded" })
