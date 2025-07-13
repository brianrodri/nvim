local my_paths = require("my.paths")
local my_utils = require("my.utils")

---@module "obsidian"
---@type obsidian.workspace.WorkspaceSpec
local PERSONAL_WORKSPACE = {
  name = "personal",
  path = my_paths.personal_vault.root_dir,
  ---@module "obsidian"
  ---@type obsidian.config.ClientOpts|{}
  overrides = {
    notes_subdir = my_paths.personal_vault.fleeting_notes_dir,
    new_notes_location = "notes_subdir",
    daily_notes = { folder = my_paths.personal_vault.daily_notes_dir, workdays_only = false },
    attachments = { img_folder = my_paths.personal_vault.attachments_dir },
  },
}

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    enabled = my_paths.personal_vault.root_dir ~= nil,
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts|{}
    opts = {
      workspaces = { PERSONAL_WORKSPACE },
      note_id_func = function(title) return title end,
      disable_frontmatter = true,
      legacy_commands = false,
    },
    keys = {
      { "<leader>nn", ":Obsidian new<cr>", desc = "New Note", silent = true },
      { "<leader>nt", ":Obsidian today<cr>", desc = "Open Today's Note", silent = true },
      {
        "<leader>na",
        function()
          local note = assert(require("obsidian").get_client():resolve_note(my_paths.personal_vault.inbox_note_path))
          local text = my_utils.trimmed(vim.fn.input({ prompt = "Append To Inbox", default = "- " }))
          if text then note:write({ update_content = function(old) return vim.list_extend(old, { text }) end }) end
        end,
        desc = "Append To Inbox (obsidian)",
        silent = true,
      },
      {
        "<leader>no",
        function()
          local note = assert(require("obsidian").get_client():resolve_note(my_paths.personal_vault.inbox_note_path))
          note:open({ sync = true })
        end,
        desc = "Open Inbox (obsidian)",
        silent = true,
      },
    },
  },
}
