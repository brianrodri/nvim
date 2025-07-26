---@module "lazy"
---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        ghost_text = { enabled = true },
        menu = {
          -- https://cmp.saghen.dev/recipes#avoid-multi-line-completion-ghost-text
          direction_priority = function()
            local ctx = require("blink.cmp").get_context()
            local item = require("blink.cmp").get_selected_item()
            if ctx == nil or item == nil then return { "s", "n" } end

            local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
            local is_multi_line = item_text:find("\n") ~= nil

            -- after showing the menu upwards, we want to maintain that direction
            -- until we re-open the menu, so store the context id in a global variable
            if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
              vim.g.blink_cmp_upwards_ctx_id = ctx.id
              return { "n", "s" }
            end
            return { "s", "n" }
          end,
        },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
        providers = {
          cmdline = {
            -- https://cmp.saghen.dev/recipes#disable-completion-in-only-shell-command-mode
            enabled = function() return vim.fn.getcmdtype() ~= ":" or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!") end,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
