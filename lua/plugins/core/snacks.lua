local my_snacks_toggle = require("my.snacks.toggle")

---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- stylua: ignore
      -- luacheck: no max line length
      opts = { ensure_installed = { "css", "html", "javascript", "latex", "norg", "regex", "scss", "svelte", "tsx", "typst", "vue" } },
      opts_extend = { "ensure_installed" },
    },
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = false }, -- NOTE: because I prefer mini.files.
      image = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      toggle = { enabled = true },
    },
    init = function() my_snacks_toggle.setup_keymaps() end,
  },
}
