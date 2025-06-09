local my_vault = require("my.vault")

local function append_prompt_to_inbox()
  vim.ui.input({ prompt = "Append To Inbox", default = "- " }, function(text)
    if vim.fn.empty(text) == 1 then return end
    local client = require("obsidian").get_client()
    local inbox_note = client:resolve_note(my_vault.inbox_note_path)
    client:write_note(inbox_note, { update_content = function(lst) return vim.list_extend(lst, { text }) end })
    local curr_note = client:current_note()
    if curr_note and curr_note.path == inbox_note.path then vim.schedule(function() vim.cmd("bufdo e") end) end
  end)
end

local function open_inbox()
  local client = require("obsidian").get_client()
  client:open_note(client:resolve_note(my_vault.inbox_note_path), { sync = true })
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
          path = my_vault.root_dir,
          strict = true,
          ---@type obsidian.config.ClientOpts|{}
          overrides = {
            notes_subdir = my_vault.fleeting_notes_dir,
            new_notes_location = "notes_subdir",
            note_id_func = function(title) return title end,
            disable_frontmatter = true,
            ---@type obsidian.config.AttachmentsOpts|{}
            attachments = { img_folder = my_vault.attachments_dir },
            ---@type obsidian.config.DailyNotesOpts|{}
            daily_notes = { folder = my_vault.daily_notes_dir, template = "Daily Template.md", workdays_only = false },
          },
        },
      },
      ---@type obsidian.config.OpenOpts|{}
      open = { use_advanced_uri = true },
      ---@type obsidian.config.CompletionOpts|{}
      completion = { blink = true },
    },
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      { "<leader>nn", function() require("obsidian").get_client():command("new", { args = "" }) end, desc = "New Note" },
      { "<leader>nt", function() require("obsidian").get_client():command("today", { args = "" }) end, desc = "Open Today's Note" },
      { "<leader>n/", function() require("snacks.picker").grep({ cwd = my_vault.root_dir }) end, desc = "Grep Notes" },
      { "<leader>ns", function() require("snacks.picker").files({ cwd = my_vault.root_dir }) end, desc = "Find Notes" },
      { "<leader>na", append_prompt_to_inbox, desc = "Append To Inbox" },
      { "<leader>no", open_inbox, desc = "Open Inbox" },
    },
  },
}
