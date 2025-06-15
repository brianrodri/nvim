---@module "lazy"
---@type LazySpec
return {
  {
    "madskjeldgaard/cppman.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "folke/snacks.nvim" },
    ---@module "cppman"
    ---@type cppman.Config|{}
    opts = { picker = "snacks" },
    keys = {
      { "<leader>c?", function() require("cppman").search() end, "Search Docs (cppman)" },
    },
  },
}
