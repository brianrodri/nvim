---@module "lazy"
---@type LazySpec
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown", "markdown_inline", "noice" },
      bullet = { icons = { "󰍴 " }, right_pad = 0, highlight = "RenderMarkdownSign" },
      heading = { backgrounds = {} },
      checkbox = {
        checked = { icon = "󰄲 ", highlight = "RenderMarkdownSuccess" },
        unchecked = { icon = "󰄮 ", highlight = "RenderMarkdownUnchecked" },
      },
    },
    opts_extend = { "file_types" },
  },
}
