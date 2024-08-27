local function select(items, opts, callback)
  local T = require "plugins.modules.telescope"

  local theme = T.themes.get_dropdown({
    layout_config = {
      width = 50,
    },
  })

  local finder = T.finders.new_table({
    results = items,
    entry_maker = function(entry)
      local display = opts.format_item and opts.format_item(entry) or entry
      return { value = entry, display = display, ordinal = display }
    end,
  })

  local attach_mappings = function()
    T.actions.select_default:replace(function(prompt_bufnr)
      T.actions.close(prompt_bufnr)
      local selection = T.actions_state.get_selected_entry()
      if selection then callback(selection.value, selection.index) end
    end)
    return true
  end

  T.pickers
    .new(theme, {
      prompt_title = opts.prompt,
      finder = finder,
      sorter = T.config.values.generic_sorter(),
      attach_mappings = attach_mappings,
    })
    :find()
end

vim.ui.select = select
