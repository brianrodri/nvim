local my_paths = require("my.paths")

local FILTER_OPTS = { cwd = my_paths.personal_vault.root_dir }

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<leader>ng", function() require("snacks.picker").grep(FILTER_OPTS) end, desc = "Grep Notes" },
      { "<leader>nf", function() require("snacks.picker").files(FILTER_OPTS) end, desc = "Find Notes" },
      { "<leader>nr", function() require("snacks.picker").recent({ filter = FILTER_OPTS }) end, desc = "Recent Notes" },
    },
  },
}
