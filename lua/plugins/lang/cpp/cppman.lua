---@module "lazy"
---@type LazySpec
return {
  {
    "v1nh1shungry/cppman.nvim",
    cmd = "Cppman",
    dependencies = { "folke/snacks.nvim" },
    ft = { "c", "cpp" },
    ---@module "cppman"
    ---@type cppman.Config
    opts = {
      picker = "snacks",
      win = {
        split = "below",
        style = "minimal",
      },
    },
    keys = {
      { "<leader>c?", function() require("cppman").search() end, desc = "Search C++ Reference", ft = { "c", "cpp" } },
    },
  },
}
