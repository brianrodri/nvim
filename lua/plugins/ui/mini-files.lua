local my_mini_files_git = require("my.mini-files-git")
local my_utils = require("my.utils")

local function by_extension(entry) return string.gsub(entry.path, ".*%.(.*)$", "%1") or "" end

--- Within a mini.files buffer: opens the item under the current cursor in a new split.
---
---@param direction "belowright vertical"|"belowright horizontal"|"aboveleft horizontal"|"aboveleft vertical"
local function open_in_split(direction)
  local MiniFiles = require("mini.files")

  local cur_win_id = MiniFiles.get_explorer_state().target_window
  local new_win_id = vim.api.nvim_win_call(cur_win_id, function()
    vim.cmd(direction .. " split")
    return vim.api.nvim_get_current_win()
  end)
  MiniFiles.set_target_window(new_win_id)
  MiniFiles.go_in({ close_on_file = true })
end

---@module "lazy"
---@type LazySpec
return {
  {
    "echasnovski/mini.files",
    lazy = false,
    opts = {
      content = {
        filter = function() return true end,
        sort = function(...) return my_utils.stable_sort_by(require("mini.files").default_sort(...), by_extension) end,
      },
      mappings = { go_in = "", go_out = "", reset = "<esc>" },
      windows = { preview = true, width_preview = 80 },
    },
    keys = {
      {
        "-",
        function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end,
        { desc = "Open Directory" },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(event)
          local buf_id = event.data.buf_id
          local map = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { desc = desc, buffer = buf_id }) end
          map("<C-l>", function() open_in_split("belowright vertical") end, "Open To Right")
          map("<C-j>", function() open_in_split("belowright horizontal") end, "Open To Bottom")
          map("<C-k>", function() open_in_split("aboveleft horizontal") end, "Open To Top")
          map("<C-h>", function() open_in_split("aboveleft vertical") end, "Open To Left")
          map("<C-c>", function() require("mini.files").close() end, "Close")
          my_mini_files_git.show_git_status(buf_id)
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferUpdate",
        callback = function(event) my_mini_files_git.show_git_status(event.data.buf_id) end,
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
  },
}
