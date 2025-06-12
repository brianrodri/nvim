local my_utils = require("my.utils")

---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    main = "nvim-treesitter.configs",
    ---@type my.types.TSConfig
    opts = {
      ensure_installed = {},
      indent = { enable = true },
      highlight = { enable = true },
    },
    config = function(_, opts)
      opts.ensure_installed = my_utils.dedupe(opts.ensure_installed)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
