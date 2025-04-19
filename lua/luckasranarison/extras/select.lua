local M = {}

local LabelSelector = {}
local ns = vim.api.nvim_create_namespace("label_select")

vim.api.nvim_set_hl(0, "SelectLabel", { bold = true, fg = "#db5962" })

LabelSelector.__index = LabelSelector

---@generic T
---@param items T[]
---@param opts { prompt: string, format_item?: fun(item: T): string }
---@param on_choice fun(item: T)
function LabelSelector:new(items, opts, on_choice)
  local instance = setmetatable({}, LabelSelector)

  instance.items = items
  instance.prompt = opts.prompt
  instance.on_choice = on_choice

  instance.formated_items = vim.tbl_map(function(value)
    if opts.format_item then
      return opts.format_item(value)
    else
      return value
    end
  end, items)

  return instance
end

function LabelSelector:create_labels()
  local used = {}
  local labels = {}
  local fallback = "a"

  for _, formated in pairs(self.formated_items) do
    local char
    local first_letter = formated:sub(1, 1):lower()

    if used[first_letter] then
      while used[fallback] do
        fallback = string.char(fallback:byte() + 1)
        if fallback:byte() > 122 then fallback = "A" end
      end
      char = fallback
    else
      char = first_letter
    end

    used[char] = true
    labels[#labels + 1] = char
  end

  return labels
end

function LabelSelector:create_popup()
  local max_len = 0

  for _, item in pairs(self.formated_items) do
    local len = #item
    if max_len < len then max_len = len end
  end

  local width = math.max(max_len + 6, 40)
  local height = math.min(#self.items, 20)
  local row, col, position
  local ui = vim.api.nvim_list_uis()[1]

  row = (ui.height - height) * 0.5
  col = (ui.width - width) * 0.5
  position = "editor"

  local bufnr = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(bufnr, true, {
    row = row,
    col = col,
    width = width,
    height = height,
    border = "rounded",
    relative = position,
    style = "minimal",
    title = " " .. self.prompt .. " ",
    title_pos = "center",
  })

  vim.wo[win].signcolumn = "yes:1"
  vim.bo[bufnr].filetype = "LabelSelect"

  return win, bufnr
end

---@param bufnr number
---@param labels string[]
function LabelSelector:fill_popup(bufnr, labels)
  local lines = {}

  for i, item in pairs(self.formated_items) do
    local row = labels[i] .. " " .. item
    lines[#lines + 1] = row
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)

  for i, _ in pairs(self.items) do
    vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
      end_col = 1,
      hl_group = "SelectLabel",
    })
  end

  vim.bo[bufnr].modifiable = false
end

---@param win number
---@param bufnr number
---@param labels string[]
function LabelSelector:apply_keymaps(win, bufnr, labels)
  local close_win = function()
    vim.api.nvim_win_close(win, true)
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end

  for idx, value in pairs(self.items) do
    vim.keymap.set("n", labels[idx], function()
      self.on_choice(value)
      close_win()
    end, { buffer = bufnr, nowait = true })
  end

  vim.keymap.set("n", "<Esc>", close_win, { buffer = bufnr })
end

---@generic T
---@param items T[]
---@param opts { prompt: string, format_item?: fun(item: T): string }
---@param on_choice fun(item: T)
M.label_select = function(items, opts, on_choice)
  local ls = LabelSelector:new(items, opts, on_choice)
  local labels = ls:create_labels()
  local win, bufnr = ls:create_popup()

  ls:fill_popup(bufnr, labels)
  ls:apply_keymaps(win, bufnr, labels)
end

return M
