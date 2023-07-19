local icons = require("utils.icons").icons
local format = require("utils.icons").format
local M = {}

M.mode = {
  "mode",
  fmt = function(name)
    local map = {
      NORMAL = icons.Normal,
      INSERT = icons.Insert,
      TERMINAL = icons.Terminal,
      VISUAL = icons.Visual,
      ["V-LINE"] = icons.Visual,
      ["V-BLOCK"] = icons.Visual,
      ["O-PENDING"] = icons.Ellipsis,
      COMMAND = icons.Command,
      REPLACE = icons.Edit,
    }
    return map[name] .. " (" .. name .. ")" or name
  end,
  color = function()
    local colors = require("tokyonight.colors")
    local mode = vim.fn.mode()
    local map = {
      n = colors.default.blue,
      i = colors.default.green,
      c = colors.default.orange,
      t = colors.default.cyan,
      R = colors.default.red,
      v = colors.default.magenta,
      V = colors.default.magenta,
      ["CTRL-V"] = colors.default.magenta,
    }
    return {
      fg = map[mode] or colors.default.fg,
      bg = colors.night.bg,
    }
  end,
}

M.branch = {
  "branch",
  icon = icons.GitBranch,
  color = function()
    local colors = require("tokyonight.colors")
    return { bg = colors.night.bg }
  end,
}

M.diff = {
  "diff",
  symbols = {
    added = format("Add", ""),
    modified = format("Change", ""),
    removed = format("Delete", ""),
  },
  color = function()
    local colors = require("tokyonight.colors")
    return { bg = colors.night.bg }
  end,
}

M.filetype = { "filetype" }

M.diagnostics = {
  "diagnostics",
  color = function()
    local colors = require("tokyonight.colors")
    return { bg = colors.night.bg }
  end,
}

M.encoding = {
  "encoding",
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.blue, bg = colors.night.bg }
  end,
}

M.fileformat = {
  "fileformat",
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.blue }
  end,
}

M.progress = {
  "progress",
  fmt = function(location) return vim.trim(location) end,
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.purple, bg = colors.night.bg }
  end,
}

M.location = {
  "location",
  fmt = function(location) return vim.trim(location) end,
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.purple, bg = colors.night.bg }
  end,
}

M.macro = {
  function() return vim.fn.reg_recording() end,
  icon = icons.Recording,
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.red }
  end,
}

M.lsp = {
  function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
    if next(clients) == nil then return "" end
    local attached_clients = vim.tbl_map(function(client) return client.name end, clients)
    return table.concat(attached_clients, ", ")
  end,
  icon = icons.Braces,
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.comment, bg = colors.night.bg }
  end,
}

M.gap = {
  function() return " " end,
  color = function()
    local colors = require("tokyonight.colors")
    return { bg = colors.night.bg }
  end,
  padding = 0,
}

return M
