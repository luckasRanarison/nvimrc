local icons = require("luckasranarison.utils.icons")
local palette = require("luckasranarison.plugins.modules.palette")

local mode_color_map = {
  n = palette.blue,
  i = palette.green,
  c = palette.yellow,
  t = palette.cyan,
  R = palette.red,
}

return {
  mode = {
    "mode",
    fmt = function() return icons.neovim end,
    color = function()
      local mode = vim.fn.mode()
      return { fg = mode_color_map[mode] or palette.magenta, bg = palette.white }
    end,
  },

  branch = {
    "branch",
    icon = icons.branch,
    color = { fg = palette.green, bg = palette.white },
  },

  diff = {
    "diff",
    symbols = { added = "󰐕 ", modified = "󰜥 ", removed = "󰍴 " },
    color = { bg = palette.white },
  },

  filetype = {
    "bo:filetype",
    color = { fg = palette.black, bg = palette.white },
  },

  filesize = {
    "filesize",
    fmt = function(str) return str ~= "" and "(" .. str .. ")" end,
    color = { fg = palette.gray, bg = palette.white },
  },

  macro = {
    function() return vim.fn.reg_recording() end,
    icon = "REC:",
    color = function() return { fg = palette.red, bg = palette.white } end,
  },

  lsp = {
    function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then return "" end
      local attached_clients = vim.tbl_map(function(client) return client.name end, clients)
      return table.concat(attached_clients, ", ")
    end,
    icon = icons.braces,
    color = function() return { fg = palette.gray, bg = palette.white } end,
  },

  diagnostics = {
    "diagnostics",
    color = { bg = palette.white },
  },

  encoding = {
    "encoding",
    color = { fg = palette.blue, bg = palette.white },
  },

  fileformat = {
    "fileformat",
    color = { fg = palette.blue, bg = palette.white },
  },

  indentation = {
    "indentation",
    fmt = function()
      local type = vim.bo[0].expandtab and "spaces" or "tabs"
      return type .. ": " .. vim.bo[0].shiftwidth
    end,
    color = { fg = palette.blue, bg = palette.white },
  },

  progress = {
    "progress",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = palette.magenta, bg = palette.white },
  },

  location = {
    "location",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = palette.magenta, bg = palette.white },
  },
}
