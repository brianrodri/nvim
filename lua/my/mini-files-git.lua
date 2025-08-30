local my_paths = require("my.paths")

local M = {}
local H = {}

---@param buf_id number
function M.show_git_status(buf_id)
  local mini_files = require("mini.files")
  local latest_path = mini_files.get_latest_path() or vim.fn.getcwd()
  local status_by_path = H.parse_git_status(latest_path)
  local num_lines = vim.api.nvim_buf_line_count(buf_id)

  local git_root = vim.system({ "git", "-C", latest_path, "rev-parse", "--show-toplevel" }, { text = true }):wait()
  if git_root.code ~= 0 or not git_root.stdout then return end

  local abs_git_root = my_paths.resolve(vim.trim(git_root.stdout))
  if not abs_git_root then return end

  vim.api.nvim_buf_clear_namespace(buf_id, H.MY_GIT_NAMESPACE_ID, 0, -1)

  local grouped_prefixes = {}
  local max_width = 0

  for line = 1, num_lines do
    local entry = mini_files.get_fs_entry(buf_id, line)
    local entry_path = entry and my_paths.resolve(entry.path)
    if vim.startswith(entry_path or "", abs_git_root .. "/") then
      local prefixes = entry_path and H.collect_statuses_for_path(entry_path, status_by_path) or {}
      grouped_prefixes[line] = prefixes or {}
      max_width = math.max(max_width, vim.iter(prefixes):map(H.get_width):fold(0, function(a, b) return a + b end))
    end
  end

  for line = 1, num_lines do
    H.apply_extmark(buf_id, line, grouped_prefixes[line] or {}, max_width)
  end
end

---@type table<string, my.PrefixTable>
H.STATUS_MAP = {
  ["A"] = { symbol = " ", highlight = "GitSignsAdd" },
  ["C"] = { symbol = " ", highlight = "GitSignsChange" },
  ["D"] = { symbol = " ", highlight = "GitSignsDelete" },
  ["M"] = { symbol = " ", highlight = "GitSignsChange" },
  ["R"] = { symbol = " ", highlight = "GitSignsChange" },
  ["T"] = { symbol = " ", highlight = "GitSignsChange" },
  ["U"] = { symbol = " ", highlight = "GitSignsChange" },
  ["!"] = { symbol = " ", highlight = "GitSignsUntracked" },
  ["?"] = { symbol = " ", highlight = "GitSignsUntracked" },
  ["m"] = { symbol = " ", highlight = "GitSignsChange" },
}

---@type integer
H.MY_GIT_NAMESPACE_ID = vim.api.nvim_create_namespace("my.git")

---@alias my.PrefixTable { symbol: string, highlight: string }

---@param prefix_tbl my.PrefixTable
---@return integer
function H.get_width(prefix_tbl) return vim.fn.strdisplaywidth(prefix_tbl.symbol) end

---@return table<string, my.PrefixTable[]>
function H.parse_git_status(latest_path)
  local git_result = vim.system({ "git", "-C", latest_path, "status", "--porcelain=v1" }, { text = true }):wait()
  if git_result.code ~= 0 then return {} end

  return vim.iter(vim.split(git_result.stdout or "", "\n")):fold({}, function(tbl, line)
    local status_code, rel_path = line:match("^.(.) (.*)$")
    local abs_path = rel_path and my_paths.resolve(rel_path)
    local git_status = status_code and H.STATUS_MAP[status_code]
    if abs_path and git_status then tbl[abs_path] = vim.list_extend(tbl[abs_path] or {}, { git_status }) end

    return tbl
  end)
end

---@param entry_path string
---@param status_by_path table<string, my.PrefixTable[]>
function H.collect_statuses_for_path(entry_path, status_by_path)
  local seen_symbols = {}
  local statuses = {}

  if status_by_path[entry_path] then
    for _, status in ipairs(status_by_path[entry_path]) do
      if not seen_symbols[status.symbol] then
        seen_symbols[status.symbol] = true
        table.insert(statuses, status)
      end
    end
  end

  for path, path_statuses in pairs(status_by_path) do
    if vim.startswith(path, entry_path .. "/") then
      for _, status in ipairs(path_statuses) do
        if not seen_symbols[status.symbol] then
          seen_symbols[status.symbol] = true
          table.insert(statuses, status)
        end
      end
    end
  end

  table.sort(statuses, function(a, b) return a.symbol < b.symbol end)

  return statuses
end

---@param buf_id number
---@param line number
---@param prefixes my.PrefixTable[]
function H.apply_extmark(buf_id, line, prefixes, max_width)
  local col = 0

  for _, prefix in ipairs(prefixes) do
    vim.api.nvim_buf_set_extmark(buf_id, H.MY_GIT_NAMESPACE_ID, line - 1, col, {
      virt_text = { { prefix.symbol, prefix.highlight } },
      virt_text_pos = "inline",
    })
    col = col + vim.fn.strdisplaywidth(prefix.symbol)
  end

  if col < max_width then
    vim.api.nvim_buf_set_extmark(buf_id, H.MY_GIT_NAMESPACE_ID, line - 1, col, {
      virt_text = { { string.rep(" ", max_width - col) } },
      virt_text_pos = "inline",
    })
  end
end

return M
