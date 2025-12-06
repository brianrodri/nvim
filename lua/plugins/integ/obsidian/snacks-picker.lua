local my_paths = require("my.paths")

local FILTER_OPTS = { cwd = my_paths.personal_vault.root_dir }

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<leader>vr", function() require("snacks.picker").recent({ filter = FILTER_OPTS }) end, desc = "Recent Notes" },
    },
  },
}
