local my_paths = require("my.paths")

local function append_prompt_to_inbox()
  vim.ui.input({ prompt = "Append To Inbox", default = "- " }, function(text)
    if vim.fn.empty(text) == 1 then return end
    local client = require("obsidian").get_client()
    local inbox_note = client:resolve_note(my_paths.personal_vault.inbox_note_path)
    client:write_note(inbox_note, { update_content = function(lst) return vim.list_extend(lst, { text }) end })
    local curr_note = require("obsidian.api").current_note()
    if curr_note and curr_note.path == inbox_note.path then vim.schedule(function() vim.cmd("bufdo e") end) end
  end)
end

local function open_inbox()
  local client = require("obsidian").get_client()
  client:open_note(client:resolve_note(my_paths.personal_vault.inbox_note_path), { sync = true })
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
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      { "<leader>nn", function() require("obsidian.commands.new")(require("obsidian").get_client(), { args = "" } --[[@as CommandArgs|{}]]) end,   desc = "New Note (obsidian)"          },
      { "<leader>nt", function() require("obsidian.commands.today")(require("obsidian").get_client(), { args = "" } --[[@as CommandArgs|{}]]) end, desc = "Open Today's Note (obsidian)" },
      { "<leader>ng", function() require("snacks.picker").grep({ cwd = my_paths.personal_vault.root_dir }) end,                                    desc = "Grep Notes (obsidian)"        },
      { "<leader>nf", function() require("snacks.picker").files({ cwd = my_paths.personal_vault.root_dir }) end,                                   desc = "Find Notes (obsidian)"        },
      { "<leader>na", append_prompt_to_inbox,                                                                                                      desc = "Append To Inbox (obsidian)"   },
      { "<leader>no", open_inbox,                                                                                                                  desc = "Open Inbox (obsidian)"        },
    },
  },
}
