---@module "lazy"
---@type LazySpec
return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    ---@module "nvim-surround"
    ---@type user_options
    opts = { move_cursor = "sticky" },
  },
}
