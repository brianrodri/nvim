local my_obsidian_pinned_note = require("my.obsidian-pinned-note")
local my_vault = require("my.paths").vault

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    enabled = my_vault:exists(),
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config
    opts = {
      workspaces = { { name = my_vault.name, path = my_vault.root_dir } },
      attachments = { folder = my_vault.attachments_folder },
      daily_notes = { folder = my_vault.daily_notes_folder, workdays_only = false, default_tags = {} },
      templates = { folder = my_vault.templates_folder },
      notes_subdir = my_vault.fleeting_notes_folder,
      new_notes_location = "notes_subdir",
      frontmatter = {
        func = function(note) return note.metadata end,
        enabled = function(path) return my_vault:is_frontmatter_enabled(path) end,
      },

      -- :help render-markdown-info-obsidian.nvim
      ui = { enable = false },
      -- TODO: Remove after upgrading to v4.0.0
      legacy_commands = false,
    },
    keys = {
      { "<leader>vn", ":Obsidian new<cr>", desc = "New Note", silent = true },
      { "<leader>vs", ":Obsidian search<cr>", desc = "Search Notes", silent = true },
      { "<leader>vf", ":Obsidian quick_switch<cr>", desc = "Find Note", silent = true },
      { "<leader>vo", ":Obsidian open<cr>", desc = "Open Obsidian", silent = true },
      { "<leader>vv", my_obsidian_pinned_note.open_pinned_note, desc = "Open Pinned Note", silent = true },
      { "<leader>va", my_obsidian_pinned_note.append_to_pinned_note, desc = "Append To Pinned Note", silent = true },
      { "<leader>vp", my_obsidian_pinned_note.pick_pinned_note, desc = "Pin/Unpin Note", silent = true },
      { "<leader>vy", ":Obsidian extract_note<cr>", desc = "Extract to Note", silent = true, mode = { "n", "v" } },
      {
        "<leader>vr",
        function() require("snacks.picker").recent({ filter = { cwd = my_vault.root_dir } }) end,
        desc = "Recent Notes",
      },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Keymaps#remove-default-mapping
      vim.api.nvim_create_autocmd("User", {
        pattern = "ObsidianNoteEnter",
        callback = function() vim.keymap.del("n", "<CR>", { buffer = true }) end,
      })
    end,
  },
}
