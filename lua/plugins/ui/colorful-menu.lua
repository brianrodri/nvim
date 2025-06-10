---@module "lazy"
---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    dependencies = { "xzbdmw/colorful-menu.nvim" },
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
                highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
              },
            },
          },
        },
      },
    },
  },
}
