local P = require("github-theme.palette").load "github_dark_default"

local mode_color_map = {
  n = P.blue.base,
  i = P.green.base,
  c = P.yellow.base,
  t = P.cyan.base,
  R = P.red.base,
}

local S = {
  mode = {
    "mode",
    fmt = function() return "" end,
    color = function()
      local mode = vim.fn.mode()
      return { fg = mode_color_map[mode] or P.magenta.base, bg = P.black.base }
    end,
  },
  branch = {
    "branch",
    icon = "",
    color = { bg = P.black.base },
  },
  diff = {
    "diff",
    symbols = { added = "󰐕 ", modified = "󰜥 ", removed = "󰍴 " },
    color = { bg = P.black.base },
  },
  filename = {
    "filename",
    file_status = false,
    path = 1,
    color = { fg = P.white.base, bg = P.black.base },
  },
  macro = {
    function() return vim.fn.reg_recording() end,
    icon = "REC:",
    color = function() return { fg = P.red.base, bg = P.black.base } end,
  },
  lsp = {
    function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then return "" end
      local attached_clients = vim.tbl_map(function(client) return client.name end, clients)
      return table.concat(attached_clients, ", ")
    end,
    icon = "󰅩",
    color = function() return { fg = P.gray.base, bg = P.black.base } end,
  },
  diagnostics = {
    "diagnostics",
    color = { bg = P.black.base },
  },
  encoding = {
    "encoding",
    color = { fg = P.blue.base, bg = P.black.base },
  },
  fileformat = {
    "fileformat",
    color = { fg = P.blue.base, bg = P.black.base },
  },
  indentation = {
    "indentation",
    fmt = function()
      local type = vim.bo[0].expandtab and "spaces" or "tabs"
      return type .. ": " .. vim.bo[0].shiftwidth
    end,
    color = { fg = P.blue.base, bg = P.canvas.default },
  },
  progress = {
    "progress",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = P.magenta.base, bg = P.canvas.default },
  },
  location = {
    "location",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = P.magenta.base, bg = P.canvas.default },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function() vim.opt.laststatus = 3 end,
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { S.mode },
      lualine_b = { S.branch, S.diff },
      lualine_c = { S.filename, S.macro },
      lualine_x = { S.lsp, S.diagnostics },
      lualine_y = { S.indentation, S.encoding, S.fileformat },
      lualine_z = { S.progress, S.location },
    },
  },
}
