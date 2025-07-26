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
      highlight = { enable = true, use_languagetree = true },
    },
    ---@param opts TSConfig|?
    config = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = my_utils.dedupe(opts.ensure_installed --[[@as table<string>]] or {})
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
