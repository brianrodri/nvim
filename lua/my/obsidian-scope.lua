local H = {}
local D = {}

---@param scope "Narrower" | "Broader"
function H.goto_new_scoped_link(scope)
  local obsidian_api = require("obsidian.api")
  local obsidian_note = require("obsidian.note")

  local current_note = obsidian_api.current_note()
  if not current_note then return end

  local new_id = obsidian_api.input('New "' .. scope .. '" Note')
  if vim.fn.empty(new_id) == 1 then return end

  local new_note = obsidian_note.create({ id = new_id, should_write = false }):write({
    template = Obsidian.opts.note.template, -- luacheck:ignore 113
    update_content = function(lines)
      return vim.list_extend(lines, {
        "## " .. (scope == "Narrower" and "Broader" or "Narrower"),
        "",
        "- " .. current_note:format_link(),
      })
    end,
  })

  H.push_location_onto_tagstack(
    new_note.id,
    current_note:insert_text(
      string.format("- " .. new_note:format_link()),
      scope == "Narrower" and D.NARROWER_OPTS or D.BROADER_SECTION
    )
  )

  vim.schedule(
    function()
      new_note:open({
        line = 1 + (new_note.has_frontmatter and new_note.frontmatter_end_line or 1),
        callback = vim.schedule_wrap(vim.cmd.checktime),
      })
    end
  )
end

---@param tagname string
---@param line_num integer
function H.push_location_onto_tagstack(tagname, line_num)
  if line_num == 0 then return end
  local buf = vim.api.nvim_get_current_buf()
  local col = 3
  local off = 0
  local new_item = { tagname = tagname, from = { buf, line_num, col, off } }
  vim.fn.settagstack(vim.fn.win_getid(), { items = { new_item } }, "t")
end

D.NARROWER_OPTS = { placement = "bot", section = { level = 2, header = "Narrower" } }
D.BROADER_SECTION = { placement = "top", section = { level = 2, header = "Broader" } }

return {
  goto_new_narrower_note = function() H.goto_new_scoped_link("Narrower") end,
  goto_new_broader_note = function() H.goto_new_scoped_link("Broader") end,
}
