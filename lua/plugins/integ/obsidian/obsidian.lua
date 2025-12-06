local my_paths = require("my.paths")

local function append_to_daily()
  local note_path_ok, note_path = pcall(require("obsidian.daily").daily_note_path, os.time())
  if not note_path_ok or not note_path then return end
  local note_ok, note = pcall(require("obsidian.note").from_file, note_path)
  if not note_ok or not note then return end
  local text_ok, text = pcall(vim.fn.input, "Append To Today's Daily Note", "- ")
  if not text_ok or not text then return end
  note:write({ update_content = function(lines) return vim.list_extend(lines, { text }) end })
end

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
    },
    keys = {
      { "<leader>vn", ":Obsidian new<cr>", desc = "New Note" },
      { "<leader>vs", ":Obsidian search<cr>", desc = "Search Notes" },
      { "<leader>vf", ":Obsidian quick_switch<cr>", desc = "Find Note" },
      { "<leader>vv", ":Obsidian today<cr>", desc = "Open Today's Daily Note" },
      { "<leader>vo", ":Obsidian open<cr>", desc = "Open Obsidian" },
      { "<leader>va", append_to_daily, desc = "Append To Today's Daily Note", silent = true },
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
