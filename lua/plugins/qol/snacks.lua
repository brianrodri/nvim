local my_snacks = require("my.snacks")

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
      explorer = { enabled = false },
      image = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      toggle = { enabled = true },

      dashboard = my_snacks.dashboard_config,
    },
    init = function()
      require("snacks.util").set_hl(my_snacks.dashboard_highlight_groups)
      my_snacks.setup_toggles()
    end,
  },
}
