local my_paths = require("my.paths")

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
      footer = { enabled = true },
      -- Disabled legacy options:
      legacy_commands = false,
      statusline = { enabled = false },
    },
    keys = {
      { "<leader>nn", ":Obsidian new<cr>", desc = "New Note", silent = true },
      { "<leader>nt", ":Obsidian today<cr>", desc = "Open Today's Daily Note", silent = true },
      {
        "<leader>na",
        function()
          local note = assert(require("obsidian.note").from_file(require("obsidian.daily").daily_note_path(os.time())))
          local text = require("obsidian.api").input("Append To Inbox", { default = "- " })
          if text then note:write({ update_content = function(lines) return vim.list_extend(lines, { text }) end }) end
        end,
        desc = "Append To Today's Daily Note (obsidian)",
        silent = true,
      },
    },
  },
}
