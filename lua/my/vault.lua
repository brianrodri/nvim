local my_env = require("my.env")

local ROOT_DIR = vim.fs.normalize(vim.fs.joinpath("~", "Documents", "Vault"), { win = my_env.wsl_mode })
local INBOX_NOTE = vim.fs.joinpath("0 - Index", "Inbox.md")
local DAILY_NOTES_DIR = vim.fs.joinpath("1 - Journal", "Daily")
local FLEETING_NOTES_DIR = vim.fs.joinpath("2 - Fleeting Notes")
local ATTACHMENTS_DIR = vim.fs.joinpath("8 - Meta", "Attachments")

return {
  root_dir = ROOT_DIR,

  actions = {
    ---@param note_path string
    open_note = function(note_path)
      local client = require("obsidian").get_client()
      local dest_note = assert(client:resolve_note(note_path), "unable to resolve note: " .. note_path)
      client:open_note(dest_note, { sync = true })
    end,

    ---@param note_path string
    ---@param default? string
    open_note_in_append_mode = function(note_path, default)
      local client = require("obsidian").get_client()
      local dest_note = assert(client:resolve_note(note_path), "unable to resolve note: " .. note_path)
      client:open_note(dest_note, {
        sync = true,
        callback = function()
          vim.cmd("normal! Go" .. (default or ""))
          vim.cmd("startinsert!")
        end,
      })
    end,

    ---@param note_path string
    ---@param default? string
    append_prompt_to_note = function(note_path, default)
      local client = require("obsidian").get_client()
      local dest_note = assert(client:resolve_note(note_path), "unable to resolve note: " .. note_path)
      require("snacks.input").input(
        { prompt = string.format("Append To %s", dest_note:display_name()), default = default },
        function(text)
          if vim.fn.empty(text) == 1 then return end
          client:write_note(dest_note, {
            sync = true,
            update_content = function(lines) return vim.list_extend(lines, { text }) end,
          })
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
      note_id_func = function(title) return title end,
      disable_frontmatter = true,
      ---@type obsidian.config.AttachmentsOpts|{}
      attachments = { img_folder = ATTACHMENTS_DIR },
      ---@type obsidian.config.DailyNotesOpts|{}
      daily_notes = { folder = DAILY_NOTES_DIR, template = "Daily Template.md", workdays_only = false },
    },
  },
  inbox_note_path = vim.fs.joinpath("0 - Index", "Inbox.md"),
}
