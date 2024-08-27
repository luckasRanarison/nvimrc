return {
  "RRethy/vim-illuminate",
  event = "LspAttach",
  opts = {
    filetypes_denylist = { "dropbar_menu" },
    large_file_cutoff = 5000,
    min_count_to_highlight = 2,
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
