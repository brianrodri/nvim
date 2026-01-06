local my_paths = require("my.paths")

local templated_folders = {
  "1. Journal/4. Exercises",
  "3. Permanent",
  "4. Literature",
  "5. Project",
}

local M = {
  name = "My Vault",
  root_dir = my_paths.resolve("~/Vault"),
  daily_notes_folder = "1. Journal/1. Daily",
  fleeting_notes_folder = "2. Fleeting",
  meta_folder = "9. Meta",
  attachments_folder = "9. Meta/Attachments",
  templates_folder = "9. Meta/Templates",
}

---@module "obsidian"
---@param note obsidian.Note
---@return table
function M.frontmatter_func(note) return note.metadata end

---@param path string
---@return boolean
function M.is_frontmatter_enabled(path)
  return vim.iter(templated_folders or {}):any(function(folder) return vim.startswith(path, folder) end)
end

---@return boolean
function M:is_ok() return self.root_dir ~= nil end

--- @param base_id? string
function M.note_id_func(base_id)
  local id_components = vim.split(base_id or "", "[^A-Za-z0-9-_.]")
  table.insert(id_components, 1, os.date("%s"))
  return vim
    .iter(id_components)
    :map(function(part)
      part = vim.trim(part)
      part = vim.fn.trim(part, "-_.")
      if vim.fn.empty(part) == 1 then return nil end
      return string.lower(part)
    end)
    :join("-")
end

return M
