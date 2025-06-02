local my_vault = require("my.vault")

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
      workspaces = { my_vault.personal },
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
      { "<leader>na", function() my_vault.actions.append_prompt_to_note(my_vault.inbox_note) end, desc = "Append To Inbox" },
      { "<leader>no", function() my_vault.actions.open_note(my_vault.inbox_note) end, desc = "Open Inbox" },
      { "<leader>nO", function() my_vault.actions.open_note_in_append_mode(my_vault.inbox_note, "- ") end, desc = "Append To Inbox" },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    ---@module "project_nvim"
    ---@type ProjectOptions|{}
    opts = { patterns = { ".obsidian" } },
    opts_extend = { "patterns" },
  },
}
