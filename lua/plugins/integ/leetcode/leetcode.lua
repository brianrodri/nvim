---@module "lazy"
---@type LazySpec
return {
  {
    "kawre/leetcode.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    ---@module "leetcode"
    ---@type lc.UserConfig|{}
    opts = {
      lang = "cpp",
      picker = { provider = "telescope" },
      image = true,
    },
  },
}
