local Utils = require("my.utils")

---@module "lazy"
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  opts = {
    indent = { enable = true },
    highlight = { enable = true },
  },
  config = function(_, opts)
    opts.ensure_installed = Utils.dedupe(opts.ensure_installed)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
