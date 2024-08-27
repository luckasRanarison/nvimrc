local M = {}

local pal = require "plugins.modules.palette"

local mode_color_map = {
  n = pal.blue,
  i = pal.green,
  c = pal.yellow,
  t = pal.cyan,
  R = pal.red,
}

M.state = { lsp_progress = nil }

M.mode = {
  "mode",
  fmt = function() return "" end,
  color = function()
    local mode = vim.fn.mode()
    return { fg = mode_color_map[mode] or pal.magenta, bg = pal.black }
  end,
}

M.branch = {
  "branch",
  icon = "",
  color = { bg = pal.black },
}

M.diff = {
  "diff",
  symbols = { added = "󰐕 ", modified = "󰜥 ", removed = "󰍴 " },
  color = { bg = pal.black },
}

M.filetype = {
  "bo:filetype",
  color = { fg = pal.white, bg = pal.black },
}

M.macro = {
  function() return vim.fn.reg_recording() end,
  icon = "REC:",
  color = function() return { fg = pal.red, bg = pal.black } end,
}

M.lsp_progress = {
  function()
    local status = M.state.lsp_progress or {}
    local client = vim.lsp.get_clients({ id = status.client_id })[1]
    if not client then return "" end
    local value = status.params.value
    if value.kind ~= "report" then return "" end
    if #value.message > 20 then value.message = value.message:sub(1, 20) .. "..." end
    return string.format("[%s] %s (%s)", value.message, value.title, client.name)
  end,
  color = function() return { fg = pal.gray, bg = pal.black } end,
}

M.lsp = {
  function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(clients) == nil then return "" end
    local attached_clients = vim.tbl_map(function(client) return client.name end, clients)
    return table.concat(attached_clients, ", ")
  end,
  icon = "󰅩",
  color = function() return { fg = pal.gray, bg = pal.black } end,
}

M.diagnostics = {
  "diagnostics",
  color = { bg = pal.black },
}

M.encoding = {
  "encoding",
  color = { fg = pal.blue, bg = pal.black },
}

M.fileformat = {
  "fileformat",
  color = { fg = pal.blue, bg = pal.black },
}

M.indentation = {
  "indentation",
  fmt = function()
    local type = vim.bo[0].expandtab and "spaces" or "tabs"
    return type .. ": " .. vim.bo[0].shiftwidth
  end,
  color = { fg = pal.blue, bg = pal.black },
}

M.progress = {
  "progress",
  fmt = function(location) return vim.trim(location) end,
  color = { fg = pal.magenta, bg = pal.black },
}

M.location = {
  "location",
  fmt = function(location) return vim.trim(location) end,
  color = { fg = pal.magenta, bg = pal.black },
}

return M
