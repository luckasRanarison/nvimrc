local icons = require("luckasranarison.utils.icons")

local palette = {
  blue = "#38b1db",
  green = "#02ee91",
  gray = "#6e7781",
  cyan = "#76e3ea",
  red = "#ff7b72",
  magenta = "#caa2f5",
  white = "#f1f1f1",
}

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
      return { fg = mode_color_map[mode] or palette.magenta, bg = "NONE" }
    end,
  },

  branch = {
    "branch",
    icon = icons.branch,
    color = { fg = "#02ee91", bg = "NONE" },
  },

  diff = {
    "diff",
    symbols = { added = "󰐕 ", modified = "󰜥 ", removed = "󰍴 " },
    color = { bg = "NONE" },
  },

  filetype = {
    "bo:filetype",
    color = { fg = palette.white, bg = "NONE" },
  },

  filesize = {
    "filesize",
    fmt = function(str) return str ~= "" and "(" .. str .. ")" end,
    color = { fg = palette.gray, bg = "NONE" },
  },

  macro = {
    function() return vim.fn.reg_recording() end,
    icon = "REC:",
    color = function() return { fg = palette.red, bg = "NONE" } end,
  },

  lsp_progress = function(state)
    return {
      function()
        local status = state.lsp_progress or {}
        local client = vim.lsp.get_clients({ id = status.client_id })[1]
        if not client then return "" end
        local value = status.params.value
        if value.kind ~= "report" then return "" end
        if #value.message > 20 then value.message = value.message:sub(1, 20) .. "..." end
        return string.format("[%s] %s (%s)", value.message, value.title, client.name)
      end,
      color = function() return { fg = palette.gray, bg = "NONE" } end,
    }
  end,

  lsp = {
    function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then return "" end
      local attached_clients = vim.tbl_map(function(client) return client.name end, clients)
      return table.concat(attached_clients, ", ")
    end,
    icon = icons.braces,
    color = function() return { fg = palette.gray, bg = "NONE" } end,
  },

  diagnostics = {
    "diagnostics",
    color = { bg = "NONE" },
  },

  encoding = {
    "encoding",
    color = { fg = "#38b1db", bg = "NONE" },
  },

  fileformat = {
    "fileformat",
    color = { fg = "#38b1db", bg = "NONE" },
  },

  indentation = {
    "indentation",
    fmt = function()
      local type = vim.bo[0].expandtab and "spaces" or "tabs"
      return type .. ": " .. vim.bo[0].shiftwidth
    end,
    color = { fg = "#38b1db", bg = "NONE" },
  },

  progress = {
    "progress",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = palette.magenta, bg = "NONE" },
  },

  location = {
    "location",
    fmt = function(location) return vim.trim(location) end,
    color = { fg = palette.magenta, bg = "NONE" },
  },
}
