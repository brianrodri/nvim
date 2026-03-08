local H = {}
local M = {}
local D = {}

function M.follow_new_child_link() H.follow_new_depth_link("Down") end

function M.follow_new_parent_link() H.follow_new_depth_link("Up") end

---@param src_dir "Down" | "Up"
function H.follow_new_depth_link(src_dir)
  local obsidian_api = require("obsidian.api")
  local obsidian_note = require("obsidian.note")

  local src_note = obsidian_api.current_note()
  if not src_note then return end

  local dst_note_id = obsidian_api.input('New "' .. src_dir .. '" Note')
  if vim.fn.empty(dst_note_id) == 1 then return end

  local dst_note = obsidian_note.create({
    id = dst_note_id,
    template = Obsidian.opts.note.template, -- luacheck:ignore 113
    should_write = true,
  })

  local link_lnum = src_note:insert_text(string.format(D.LINK_FORMAT, dst_note:format_link()), {
    section = src_dir == "Down" and D.DOWN_SECTION or D.UP_SECTION,
    placement = src_dir == "Down" and "bot" or "top",
    check_buffers = true,
  })

  H.truncate_tagstack_with_jump_into_link(dst_note.id, link_lnum)

  dst_note:insert_text(string.format(D.LINK_FORMAT, src_note:format_link()), {
    section = src_dir == "Down" and D.UP_SECTION or D.DOWN_SECTION,
    placement = src_dir == "Down" and "top" or "bot",
    check_buffers = true,
  })

  dst_note:open({ callback = vim.cmd.checktime })
end

---@param tagname string
---@param lnum integer
function H.truncate_tagstack_with_jump_into_link(tagname, lnum)
  local bufnum = vim.api.nvim_get_current_buf()
  local col = 3
  local off = 0
  local new_item = {
    bufnr = 0,
    from = { bufnum, lnum, col, off },
    tagname = tagname,
  }
  vim.fn.settagstack(vim.fn.win_getid(), { items = { new_item } }, "t")
end

D.LINK_FORMAT = "- %s"
D.UP_SECTION = { level = 2, header = "Up" }
D.DOWN_SECTION = { level = 2, header = "Down" }

return M
