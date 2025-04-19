return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  event = { "InsertEnter" },
  opts = {
    completion = {
      menu = {
        border = "rounded",
        scrollbar = false,
      },
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
    keymap = { preset = "enter" },
    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
