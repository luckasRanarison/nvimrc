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
        border = false,
        layout_strategy = "center",
        sorting_strategy = "ascending",
        results_title = false,
        layout_config = {
          width = 50,
          height = 10,
        },
        prompt_prefix = format("Search", ""),
        selection_caret = format("Right", ""),
      },
    },
  },
}
