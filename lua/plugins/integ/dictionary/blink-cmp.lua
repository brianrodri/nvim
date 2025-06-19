---@module "lazy"
---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    dependencies = { "Kaiser-Yang/blink-cmp-dictionary" },
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "dictionary" },
        providers = {
          dictionary = {
            name = "dictionary",
            module = "blink-cmp-dictionary",
            min_keyword_length = 3,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
