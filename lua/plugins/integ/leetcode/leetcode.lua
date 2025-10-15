---@module "lazy"
---@type LazySpec
return {
  {
    "kawre/leetcode.nvim",
    dependencies = {
      "3rd/image.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ---@module "leetcode"
    ---@type lc.UserConfig|{}
    opts = {
      lang = "cpp",
      injector = { ["cpp"] = { imports = function() return require("my.leetcode-imports").cpp end } },
      image_support = true,
    },
  },
}
