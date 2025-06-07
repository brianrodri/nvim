--- Within a mini.files buffer: opens the item under the current cursor in a new split.
---
---@param direction "belowright vertical"|"belowright horizontal"|"aboveleft horizontal"|"aboveleft vertical"
local function open_in_split(direction)
  local MiniFiles = require("mini.files")
  local cur_target = MiniFiles.get_explorer_state().target_window
  local new_target = vim.api.nvim_win_call(cur_target, function()
    vim.cmd(direction .. " split")
    return vim.api.nvim_get_current_win()
  end)
  MiniFiles.set_target_window(new_target)
  MiniFiles.go_in({ close_on_file = true })
end

--- Within a mini.files buffer: adds/removes the entry under the cursor to avante's list of selected files.
---
---@param buf_id integer
---@param set_selected? boolean
local function avante_set_entry_enabled(buf_id, set_selected)
  local Avante = require("avante")
  local AvanteUtils = require("avante.utils")
  local MiniFiles = require("mini.files")

  ---@type nil|{ name: string, path: string, fs_type: "directory"|"file" }
  local entry = MiniFiles.get_fs_entry(buf_id)
  if not entry then
    vim.notify("cursor path not valid", vim.log.levels.ERROR, { title = "Avante", id = "ERR:mini.files:avante" })
    return
  end

  local sidebar = Avante.get()
  if set_selected then
    sidebar.file_selector:add_selected_file(AvanteUtils.relative_path(entry.path))
  else
    vim
      .iter(AvanteUtils.scan_directory({ directory = entry.path, add_dirs = false }))
      :map(AvanteUtils.relative_path)
      :each(function(rel_path) sidebar.file_selector:remove_selected_file(rel_path) end)
  end

  vim.notify("file selection synced", vim.log.levels.INFO, { title = "Avante", id = "OK:mini.files:avante" })
end

---@module "lazy"
---@type LazySpec
return {
  "echasnovski/mini.files",
  lazy = false,
  opts = {
    mappings = { go_in = "", go_out = "", reset = "<esc>" },
    windows = { preview = true },
  },
  keys = {
    { "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, { desc = "Open Directory" } },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(event)
        local buf_id = event.data.buf_id
        local buf_keymap = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { desc = desc, buffer = buf_id }) end
        buf_keymap("<C-l>", function() open_in_split("belowright vertical") end, "Open To Right")
        buf_keymap("<C-j>", function() open_in_split("belowright horizontal") end, "Open To Bottom")
        buf_keymap("<C-k>", function() open_in_split("aboveleft horizontal") end, "Open To Top")
        buf_keymap("<C-h>", function() open_in_split("aboveleft vertical") end, "Open To Left")
        buf_keymap("+", function() avante_set_entry_enabled(buf_id, true) end, "Avante: Select Path")
        buf_keymap("-", function() avante_set_entry_enabled(buf_id, false) end, "Avante: Unselect Path")
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        vim.schedule(function() require("snacks.rename").on_rename_file(event.data.from, event.data.to) end)
      end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionDelete",
      callback = function(event)
        vim.schedule(function() require("snacks.bufdelete").delete({ file = event.data.from }) end)
      end,
    })
  end,
}
