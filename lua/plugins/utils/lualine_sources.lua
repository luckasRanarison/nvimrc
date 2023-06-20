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
      COMMAND = icons.Command,
      REPLACE = icons.Edit,
    }
    return map[name] or name
  end,
  separator = { right = icons.TopLeftTriangle },
}

M.branch = {
  "branch",
  icon = icons.GitBranch,
  separator = nil,
  color = function()
    local colors = require("tokyonight.colors")
    return { bg = colors.night.bg_dark }
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
    return { bg = colors.night.bg_dark }
  end,
}

M.filetype = { "filetype", icon_only = true }

M.filename = {
  "filename",
  symbols = {
    modified = icons.NotSaved,
    readonly = "-",
    unnamed = "No Name",
    newfile = "New",
  },
}

M.diagnostics = { "diagnostics" }

M.encoding = { "encoding" }

M.hostname = {
  "hostname",
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.blue }
  end,
}

M.fileformat = {
  "fileformat",
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.blue }
  end,
  symbols = {
    unix = icons.Fedora,
  },
}

M.progress = {
  "progress",
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.default.orange, bg = colors.night.bg_dark }
  end,
}

M.location = {
  "location",
  separator = { left = icons.DownRightTriangle },
  color = function()
    local colors = require("tokyonight.colors")
    return { fg = colors.night.bg_dark, bg = colors.default.orange }
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
}

return M
