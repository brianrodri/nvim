local my_obsidian_pinned_note = require("my.obsidian-pinned-note")
local my_paths = require("my.paths")

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    enabled = my_paths.personal_vault.root_dir ~= nil,
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config
    opts = {
      attachments = { img_folder = my_paths.personal_vault.attachments_dir },
      daily_notes = { folder = my_paths.personal_vault.daily_notes_dir, workdays_only = false },
      frontmatter = { enabled = false },
      new_notes_location = "notes_subdir",
      note_id_func = function(title) return title end,
      notes_subdir = my_paths.personal_vault.fleeting_notes_dir,
      workspaces = { { name = "Vault", path = my_paths.personal_vault.root_dir } },
      legacy_commands = false,
      -- :help render-markdown-info-obsidian.nvim
      ui = { enable = false },
      picker = { name = "snacks.pick" },
    },
    keys = {
      { "<leader>vn", ":Obsidian new<cr>", desc = "New Note", silent = true },
      { "<leader>vs", ":Obsidian search<cr>", desc = "Search Notes", silent = true },
      { "<leader>vf", ":Obsidian quick_switch<cr>", desc = "Find Note", silent = true },
      { "<leader>vo", ":Obsidian open<cr>", desc = "Open Obsidian", silent = true },
      { "<leader>vv", my_obsidian_pinned_note.open_pinned_note, desc = "Open Pinned Note", silent = true },
      { "<leader>va", my_obsidian_pinned_note.append_to_pinned_note, desc = "Append To Pinned Note", silent = true },
      { "<leader>vp", my_obsidian_pinned_note.pick_pinned_note, desc = "Pin/Unpin Note", silent = true },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Keymaps#remove-default-mapping
      vim.api.nvim_create_autocmd("User", {
        pattern = "ObsidianNoteEnter",
        callback = function(ev) vim.keymap.del("n", "<CR>", { buffer = ev.buf }) end,
      })
    end,
  },
}
