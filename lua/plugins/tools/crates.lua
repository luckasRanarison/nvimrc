local format = require("utils.icons").format

return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  keys = {
    {
      "<leader>Cv",
      mode = "n",
      ":lua require('crates').show_versions_popup()<CR>",
      desc = format("Info", "Show versions popup"),
    },
    {
      "<leader>Cf",
      mode = "n",
      ":lua require('crates').show_features_popup()<CR>",
      desc = format("Stack", "Show features popup"),
    },
    {
      "<leader>Cd",
      mode = "n",
      ":lua require('crates').show_dependencies_popup()<CR>",
      desc = format("Dependencies", "Show dependencies popup"),
    },
    {
      "<leader>Cu",
      mode = "n",
      ":lua require('crates').update_crate()<CR>",
      desc = format("Update", "Update crate"),
    },
    {
      "<leader>Cu",
      mode = "v",
      ":lua require('crates').update_crates()<CR>",
      desc = format("Update", "Update crates"),
    },
    {
      "<leader>CU",
      mode = "n",
      ":lua require('crates').update_all_crates()<CR>",
      desc = format("Update", "Update all crates"),
    },
    {
      "<leader>CD",
      mode = "n",
      ":lua require('crates').open_documentation()<CR>",
      desc = format("DefaultFile", "Open documentation"),
    },
    {
      "<leader>Ch",
      mode = "n",
      ":lua require('crates').open_homepage()<CR>",
      desc = format("Web", "Open homepage"),
    },
    {
      "<leader>Cc",
      mode = "n",
      ":lua require('crates').open_crates_io()<CR>",
      desc = format("Package", "Open crates.io"),
    },
    {
      "<leader>Cr",
      mode = "n",
      ":lua require('crates').open_repository()<CR>",
      desc = format("Github", "Open repository"),
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    null_ls = {
      enabled = false,
      name = "Crates",
    },
  },
}
