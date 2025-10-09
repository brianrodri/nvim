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
      disable_frontmatter = true,
      new_notes_location = "notes_subdir",
      note_id_func = function(title) return title end,
      notes_subdir = my_paths.personal_vault.fleeting_notes_dir,
      workspaces = { { name = "Vault", path = my_paths.personal_vault.root_dir } },
      -- :help render-markdown-info-obsidian.nvim
      ui = { enable = false },
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
