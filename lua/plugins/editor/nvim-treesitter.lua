return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "c",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "sql",
        "query",
        "icelang",
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.icelang = {
        install_info = {
          url = "https://github.com/luckasRanarison/tree-sitter-icelang",
          files = { "src/parser.c" },
          branch = "master",
        },
        filetype = "icelang",
      }

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}
