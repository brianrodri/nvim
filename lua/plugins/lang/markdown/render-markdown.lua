---@module "lazy"
---@type LazySpec
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown", "markdown_inline" },
      bullet = { icons = { "󰍴 " }, right_pad = 0, highlight = "@comment" },
      heading = { backgrounds = {} },
      checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 ", highlight = "RenderMarkdownHint", scope_highlight = "my.todo.obsolete" },
      },
    },
    opts_extend = { "file_types" },
  },
}
