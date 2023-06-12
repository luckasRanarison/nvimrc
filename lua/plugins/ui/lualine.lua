local icons = require("utils.icons").icons
local format = require("utils.icons").format
local sources = require("plugins.utils.lualine_sources")

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(name)
            local map = {
              NORMAL = icons.Normal,
              INSERT = icons.Insert,
              TERMINAL = icons.Terminal,
              VISUAL = icons.Visual,
              ["V-LINE"] = icons.Visual,
              ["V-BLOCK"] = icons.Visual,
              COMMAND = icons.Command,
            }
            return map[name] or name
          end,
          separator = { right = "◤" },
        },
      },
      lualine_b = {
        {
          "branch",
          icon = icons.GitBranch,
          separator = nil,
          color = function()
            local colors = require("tokyonight.colors")
            return { bg = colors.night.bg_dark }
          end,
        },
        {
          "diff",
          symbols = {
            added = format("Add", ""),
            modified = format("Change", ""),
            removed = format("Delete", ""),
          },
          color = function()
            local colors = require("tokyonight.colors")
            return { bg = colors.night.bg_dark }
          end,
        },
      },
      lualine_c = {
        { "filetype", icon_only = true },
        {
          "filename",
          symbols = {
            modified = icons.NotSaved,
            readonly = "-",
            unnamed = "No Name",
            newfile = "New",
          },
        },
      },
      lualine_x = {
        "diagnostics",
        sources.active_lsp,
        "encoding",
        {
          "hostname",
          color = function()
            local colors = require("tokyonight.colors")
            return { fg = colors.default.blue }
          end,
        },
        {
          "fileformat",
          color = function()
            local colors = require("tokyonight.colors")
            return { fg = colors.default.blue }
          end,
          symbols = {
            unix = icons.Fedora,
          },
        },
      },
      lualine_y = {
        {
          "progress",
          color = function()
            local colors = require("tokyonight.colors")
            return { fg = colors.default.orange, bg = colors.night.bg_dark }
          end,
        },
      },
      lualine_z = {
        {
          "location",
          separator = { left = "◢" },
          color = function()
            local colors = require("tokyonight.colors")
            return { fg = colors.night.bg_dark, bg = colors.default.orange }
          end,
        },
      },
    },
  },
}
