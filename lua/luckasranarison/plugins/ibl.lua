return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    exclude = {
      buftypes = {
        "nofile",
        "terminal",
      },
      filetypes = {
        "help",
        "lazy",
        "TelescopePrompt",
      },
    },
    scope = {
      show_start = false,
      show_end = false,
      highlight = { "keyword" },
      char = "▏",
      include = {
        node_type = {
          lua = { "table_constructor" },
        },
      },
    },
    whitespace = {
      remove_blankline_trail = true,
    },
    indent = { char = "▏" },
  },
}
