local my_paths = require("my.paths")
local my_utils = require("my.utils")

local function resolve_note_strict(query)
  local note = require("obsidian").get_client():resolve_note(query)
  assert(require("obsidian.note").is_note_obj(note), vim.inspect(query) .. " did not resolve to exactly one note")
  return note
end

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts|{}
    opts = {
      ui = { enable = false },
      workspaces = {
        {
          name = "My Vault",
          path = my_paths.personal_vault.root_dir,
          strict = true,
          ---@type obsidian.config.ClientOpts|{}
          overrides = {
            notes_subdir = my_paths.personal_vault.fleeting_notes_dir,
            new_notes_location = "notes_subdir",
            note_id_func = function(title) return title end,
            disable_frontmatter = true,
            ---@type obsidian.config.AttachmentsOpts|{}
            attachments = { img_folder = my_paths.personal_vault.attachments_dir },
            ---@type obsidian.config.DailyNotesOpts|{}
            daily_notes = {
              folder = my_paths.personal_vault.daily_notes_dir,
              template = "Daily Template.md",
              workdays_only = false,
            },
          },
        },
      },
      ---@type obsidian.config.OpenOpts|{}
      open = { use_advanced_uri = true },
      ---@type obsidian.config.CompletionOpts|{}
      completion = { blink = true },
      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Commands
      legacy_commands = false,
    },
    keys = {
      { "<leader>nn", ":Obsidian new<cr>", desc = "New Note (obsidian)", silent = true },
      { "<leader>nt", ":Obsidian today<cr>", desc = "Open Today's Note (obsidian)", silent = true },
      {
        "<leader>ng",
        function() require("snacks.picker").grep({ cwd = my_paths.personal_vault.root_dir }) end,
        desc = "Grep Notes (obsidian)",
      },
      {
        "<leader>nf",
        function() require("snacks.picker").files({ cwd = my_paths.personal_vault.root_dir }) end,
        desc = "Find Notes (obsidian)",
      },
      {
        "<leader>nr",
        function() require("snacks.picker").recent({ filter = { cwd = my_paths.personal_vault.root_dir } }) end,
        desc = "Recent Notes (obsidian)",
      },
      {
        "<leader>na",
        function()
          local note = resolve_note_strict(my_paths.personal_vault.inbox_note_path)
          local text = my_utils.trimmed(require("obsidian.api").input("Append To Inbox", { default = "- " }))
          if text then note:write({ update_content = function(lines) return vim.list_extend(lines, { text }) end }) end
          if vim.fn.bufnr(note.path.filename) ~= -1 then vim.cmd.checktime(note.path.filename) end
        end,
        desc = "Append To Inbox (obsidian)",
        silent = true,
      },
      {
        "<leader>no",
        function() resolve_note_strict(my_paths.personal_vault.inbox_note_path):open({ sync = true }) end,
        desc = "Open Inbox (obsidian)",
        silent = true,
      },
    },
  },
}
