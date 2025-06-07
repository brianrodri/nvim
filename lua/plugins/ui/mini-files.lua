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
