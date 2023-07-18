local format = require("utils.icons").format

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = false,
    },
    select = {
      backend = { "telescope" },
      telescope = {
        border = true,
        sorting_strategy = "ascending",
        results_title = false,
        layout_config = {
          height = 24,
          width = 75,
        },
        prompt_prefix = format("Search", ""),
        selection_caret = format("Right", ""),
      },
    },
  },
}
