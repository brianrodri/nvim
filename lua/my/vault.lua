local ROOT_DIR = vim.fs.normalize(vim.fs.joinpath("~", "Documents", "Vault"))
local INBOX_NOTE = vim.fs.joinpath(ROOT_DIR, "0 - Index", "Inbox.md")
local DAILY_NOTES_DIR = vim.fs.joinpath(ROOT_DIR, "1 - Journal", "Daily")
local FLEETING_NOTES_DIR = vim.fs.joinpath(ROOT_DIR, "2 - Fleeting Notes")
local ATTACHMENTS_DIR = vim.fs.joinpath(ROOT_DIR, "8 - Meta", "Attachments")

return {
  root_dir = ROOT_DIR,
  inbox_note = INBOX_NOTE,

  actions = {
    open_note = function(note) require("obsidian").get_client():open_note(note) end,

    open_note_in_append_mode = function(note, auto_appended_text)
      require("obsidian").get_client():open_note(note, {
        callback = function()
          vim.cmd(string.format("normal! Go%s", auto_appended_text or ""))
          vim.cmd("startinsert!")
        end,
      })
    end,

    append_prompt_to_note = function(path)
      local client = require("obsidian").get_client()
      local dest_note = assert(client:resolve_note(path), string.format('failed to resolve note at path: "%s"', path))
      require("snacks.input").input(
        { prompt = string.format("Append To %s", dest_note:display_name()), default = "- " },
        function(text)
          if vim.fn.empty(text) == 1 then return end
          client:write_note(dest_note, { update_content = function(lines) return vim.list_extend(lines, { text }) end })
          local curr_note = client:current_note()
          if curr_note and curr_note.path == dest_note.path then vim.schedule(function() vim.cmd("bufdo e") end) end
        end
      )
    end,
  },

  ---@module "obsidian"
  ---@type obsidian.workspace.WorkspaceSpec|{}
  personal = {
    name = "Vault",
    path = ROOT_DIR,
    strict = true,
    ---@type obsidian.config.ClientOpts|{}
    overrides = {
      notes_subdir = FLEETING_NOTES_DIR,
      new_notes_location = "notes_subdir",
      disable_frontmatter = true,
      use_advanced_uri = true,
      ---@type obsidian.config.AttachmentsOpts|{}
      attachments = { img_folder = ATTACHMENTS_DIR },
      ---@type obsidian.config.DailyNotesOpts|{}
      daily_notes = { folder = DAILY_NOTES_DIR, template = "Daily Template.md", workdays_only = false },
    },
  },
}
