---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(items, opts, callback)
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local config = require "telescope.config"
  local actions = require "telescope.actions"
  local actions_state = require "telescope.actions.state"
  local theme = require("telescope.themes").get_dropdown()

  theme.layout_config.width = 50

  local picker_opts = {
    prompt_title = opts.prompt,
    finder = finders.new_table({
      results = items,
      entry_maker = function(entry)
        local display = opts.format_item and opts.format_item(entry) or entry
        return { value = entry, display = display, ordinal = display }
      end,
    }),
    sorter = config.values.generic_sorter(),
    attach_mappings = function()
      actions.select_default:replace(function(prompt_bufnr)
        local selection = actions_state.get_selected_entry()
        if not selection then return end
        actions.close(prompt_bufnr)
        callback(selection.value, selection.index)
      end)
      return true
    end,
  }

  pickers.new(theme, picker_opts):find()
end
