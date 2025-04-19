---@diagnostic disable: duplicate-set-field

-- FIXME: Replace with a custom label based picker
vim.ui.select = function(items, opts, callback)
  local telescope = require("luckasranarison.plugins.modules.telescope")

  local theme = telescope.themes.get_dropdown({
    layout_config = {
      width = 50,
    },
  })

  local finder = telescope.finders.new_table({
    results = items,
    entry_maker = function(entry)
      local display = opts.format_item and opts.format_item(entry) or entry
      return { value = entry, display = display, ordinal = display }
    end,
  })

  local attach_mappings = function()
    telescope.actions.select_default:replace(function(prompt_bufnr)
      telescope.actions.close(prompt_bufnr)
      local selection = telescope.actions_state.get_selected_entry()
      if selection then callback(selection.value, selection.index) end
    end)
    return true
  end

  telescope.pickers
    .new(theme, {
      prompt_title = opts.prompt,
      finder = finder,
      sorter = telescope.config.values.generic_sorter(),
      attach_mappings = attach_mappings,
    })
    :find()
end
