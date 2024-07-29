local pal = require "plugins.modules.palette"

local mode_color_map = {
  n = pal.blue,
  i = pal.green,
  c = pal.yellow,
  t = pal.cyan,
  R = pal.red,
}

local state = { lsp_progress = nil }

local S = {
  mode = {
    "mode",
    fmt = function() return "" end,
    color = function()
      local mode = vim.fn.mode()
      return { fg = mode_color_map[mode] or pal.magenta, bg = pal.black }
    end,
  },
  branch = {
    "branch",
    icon = "",
    color = { bg = pal.black },
  },
  diff = {
    "diff",
    symbols = { added = "󰐕 ", modified = "󰜥 ", removed = "󰍴 " },
    color = { bg = pal.black },
  },
  filename = {
    "filename",
    file_status = false,
    path = 1,
    color = { fg = pal.white, bg = pal.black },
  },
  macro = {
    function() return vim.fn.reg_recording() end,
    icon = "REC:",
    color = function() return { fg = pal.red, bg = pal.black } end,
  },
  lsp_progress = {
    function()
      local status = state.lsp_progress or {}
      local client = vim.lsp.get_clients({ id = status.client_id })[1]
      if not client then return "" end
      local value = status.params.value
      if value.kind ~= "report" then return "" end
      if #value.message > 20 then value.message = value.message:sub(1, 20) .. "..." end
      return string.format("[%s] %s (%s)", value.message, value.title, client.name)
    end,
    color = function() return { fg = pal.gray, bg = pal.black } end,
  },
  lsp = {
    function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then return "" end
      local attached_clients = vim.tbl_map(function(client) return client.name end, clients)
      return table.concat(attached_clients, ", ")
    end,
    icon = "󰅩",
    color = function() return { fg = pal.gray, bg = pal.black } end,
  },
  diagnostics = {
    "diagnostics",
    color = { bg = pal.black },
  },
  encoding = {
    "encoding",
    color = { fg = pal.blue, bg = pal.black },
  },
  fileformat = {
    "fileformat",
    color = { fg = pal.blue, bg = pal.black },
  },
  indentation = {
    "indentation",
    fmt = function()
      local type = vim.bo[0].expandtab and "spaces" or "tabs"
      return type .. ": " .. vim.bo[0].shiftwidth
    end,
    color = { fg = pal.blue, bg = pal.black },
  },
  progress = {
    "progress",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = pal.magenta, bg = pal.black },
  },
  location = {
    "location",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = pal.magenta, bg = pal.black },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { S.mode },
      lualine_b = { S.branch, S.diff },
      lualine_c = { S.filename, S.macro },
      lualine_x = { S.lsp_progress, S.lsp, S.diagnostics },
      lualine_y = { S.indentation, S.encoding, S.fileformat },
      lualine_z = { S.progress, S.location },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspProgress", {
      callback = function(args) state.lsp_progress = args.data end,
    })

    opts.options.theme = require "lualine.themes.github_dark_default"
    opts.options.theme.normal.c.bg = pal.black
    vim.opt.laststatus = 3
    require("lualine").setup(opts)
  end,
}
