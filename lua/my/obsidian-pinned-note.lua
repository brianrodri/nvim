---@diagnostic disable: unused-local, unused-function
local my_vault = require("my.vault")

local function get_inbox_note()
  local obsidian_note = require("obsidian.note")
  return assert(obsidian_note.from_file(my_vault.inbox_note))
end

local function get_pinned_note()
  local obsidian_note = require("obsidian.note")
  return vim.g.MyPinnedNote and obsidian_note.from_file(vim.g.MyPinnedNote) or get_inbox_note()
end

local function set_pinned_note(target)
  local old_note = get_pinned_note()
  local new_note = target or get_inbox_note()
  if new_note.path ~= old_note.path then
    vim.notify("󰐃 " .. new_note.path.stem, "info")
    vim.g.MyPinnedNote = new_note.path.filename
  end
end

local M = {}

---@param bufnr integer|?
function M.pick_pinned_note(bufnr)
  local current_note = require("obsidian.api").current_note(bufnr)
  if current_note then
    set_pinned_note(current_note)
  else
    require("snacks.picker").files({
      title = "Note to be Pinned",
      dirs = { my_vault.root_dir },
      filter = {
        filter = function(p)
          if not vim.endswith(p.file, ".md") then return false end
          if string.find(p.file, my_vault.meta_folder) then return false end
          return true
        end,
      },
      layout = { preset = "vscode", layout = { height = 0.14589803 } },
      confirm = function(picker, item)
        picker:close()
        set_pinned_note(require("obsidian.note").from_file(item._path or item.filename or nil))
      end,
    })
  end
end

function M.append_to_pinned_note()
  local note = get_pinned_note()
  local prompt = "Append to " .. vim.inspect(note.path.stem)
  local text_ok, text = pcall(require("obsidian.api").input, prompt, { default = "- " })
  if not text_ok or not text then return end
  note:write({
    update_content = function(lines)
      local last_line = vim.trim(lines[#lines] or "")
      local new_lines = vim.fn.copy(lines)
      if vim.startswith(last_line, "#") then table.insert(new_lines, "") end
      table.insert(new_lines, text)
      return new_lines
    end,
  })
end

function M.open_pinned_note() require("obsidian.api").open_note(get_pinned_note().path.filename) end

return M
