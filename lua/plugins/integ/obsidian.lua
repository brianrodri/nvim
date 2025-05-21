local Vaults = require("my.vaults")

--- Appends text from a user prompt to the note located at the given path.
---
---@param path string
local append_prompt_to_note = function(path)
  local client = require("obsidian").get_client()
  local resolved_note = assert(client:resolve_note(path))
  local text = vim.fn.input(string.format("Append To %s", resolved_note:display_name()), "- ")
  if vim.fn.empty(text) == 1 then return end
  client:write_note(resolved_note, { update_content = function(lines) return vim.list_extend(lines, { text }) end })
  local current_note = client:current_note()
  if current_note and current_note.path == resolved_note.path then vim.schedule(function() vim.cmd("bufdo e") end) end
end

---@module "lazy"
---@type LazySpec
return {
  {
    "brianrodri/obsidian.nvim", -- TODO(obsidian-nvim/obsidian.nvim#137): Stop using my fork.
    branch = "substitution-context",
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts
    ---@diagnostic disable: missing-fields
    opts = {
      completion = { blink = true },
      ui = { enable = false },
      workspaces = { Vaults.personal },
    },
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      { "<leader>na", function() append_prompt_to_note(Vaults.inbox_note.path) end, desc = "Append To Inbox" },
      { "<leader>no", function() require("obsidian").get_client():open_note(Vaults.inbox_note.path) end, desc = "Open Inbox" },
      { "<leader>n/", function() require("obsidian").get_client():command("search", { args = "" }) end, desc = "Grep Notes" },
      { "<leader>ns", function() require("obsidian").get_client():command("quick_switch", { args = "" }) end, desc = "Search Notes" },
      { "<leader>nn", function() require("obsidian").get_client():command("new", { args = "" }) end, desc = "New Note" },
      { "<leader>nt", function() require("obsidian").get_client():command("today", { args = "" }) end, desc = "Open Today's Note" },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    ---@module "project_nvim"
    ---@type ProjectOptions
    opts = { patterns = { ".obsidian" } },
    opts_extend = { "patterns" },
  },
}
