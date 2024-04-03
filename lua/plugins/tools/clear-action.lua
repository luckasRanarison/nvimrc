local fmt = require("utils.icons").fmt

return {
  "luckasRanarison/clear-action.nvim",
  event = "LspAttach",
  opts = {
    signs = {
      show_count = false,
      show_label = true,
      combine = true,
    },
    popup = {
      hide_cursor = true,
    },
    mappings = {
      code_action = { "<leader>la", fmt("Fix", "Code action") },
      apply_first = { "<leader>aa", fmt("Fix", "Apply") },
      quickfix = { "<leader>aq", fmt("Fix", "Quickfix") },
      quickfix_next = { "<leader>an", fmt("Fix", "Quickfix next") },
      quickfix_prev = { "<leader>ap", fmt("Fix", "Quickfix prev") },
      refactor = { "<leader>ar", fmt("Fix", "Refactor") },
      refactor_inline = { "<leader>aR", fmt("Fix", "Refactor inline") },
      actions = {
        ["rust_analyzer"] = {
          ["Import"] = { "<leader>ai", fmt("Fix", "Import") },
          ["Replace if"] = { "<leader>am", fmt("Fix", "Replace if with match") },
          ["Fill match"] = { "<leader>af", fmt("Fix", "Fill match arms") },
          ["Wrap"] = { "<leader>aw", fmt("Fix", "Wrap") },
          ["Insert `mod"] = { "<leader>aM", fmt("Fix", "Insert mod") },
          ["Insert `pub"] = { "<leader>aP", fmt("Fix", "Insert pub mod") },
          ["Add braces"] = { "<leader>ab", fmt("Fix", "Add braces") },
        },
      },
    },
    quickfix_filters = {
      ["rust_analyzer"] = {
        ["E0412"] = "Import",
        ["E0425"] = "Import",
        ["E0433"] = "Import",
        ["unused_imports"] = "remove",
      },
    },
  },
}
