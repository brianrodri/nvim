local my_styles = require("my.styles")

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
      callout = my_styles.RENDER_MARKDOWN_CALLOUT_OPTS,
      checkbox = { custom = my_styles.RENDER_MARKDOWN_CHECKBOX_OPTS },
      preset = "obsidian",
    },

    opts_extend = { "file_types" },

    ---@module "render-markdown"
    ---@param opts render.md.UserConfig|?
    config = function(_, opts)
      opts = vim.tbl_deep_extend("keep", { checkbox = { custom = {} } }, opts or {})
      opts.checkbox.custom.todo = nil
      require("render-markdown").setup(opts)
    end,
  },
}
