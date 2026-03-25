local my_utils = require("my.utils")

---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    opts = { ensure_installed = {} },
    opts_extend = { "ensure_installed" },
    config = function(_, opts)
      local nvim_treesitter = require("nvim-treesitter")
      nvim_treesitter.setup(opts)
      nvim_treesitter.install(my_utils.dedupe(opts.ensure_installed))
    end,
  },
}
