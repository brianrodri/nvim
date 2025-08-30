---@module "lazy"
---@type LazySpec
return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    opts = {
      options = {
        use_icons_from_diagnostic = true,
        multilines = { enabled = true },
        softwrap = 32,
      },
    },
    -- https://github.com/rachartier/tiny-inline-diagnostic.nvim#lazynvim
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
