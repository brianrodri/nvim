local my_utils = require("my.utils")

--- Inspiration: https://publish.obsidian.md/tasks/Reference/Status+Collections/Minimal+Theme#Supported+statuses
---
---@module "render-markdown"
---@type { [string]: render.md.checkbox.UserConfig }
local MY_CHECKBOX_OPTS = {
  bookmark = { raw = "[b]", rendered = "󰃀", highlight = "RenderMarkdownInfo" },
  canceled = { raw = "[-]", rendered = "󱋬", highlight = "RenderMarkdownDash" },
  cons = { raw = "[c]", rendered = "󰔑", highlight = "RenderMarkdownError" },
  down = { raw = "[d]", rendered = "󰔳", highlight = "RenderMarkdownError" },
  fire = { raw = "[f]", rendered = "󰈸", highlight = "RenderMarkdownError" },
  forwarded = { raw = "[>]", rendered = "󰒊", highlight = "RenderMarkdownHint" },
  hint = { raw = "[h]", rendered = "󰌶", highlight = "RenderMarkdownHint" },
  idea = { raw = "[i]", rendered = "󰛨", highlight = "RenderMarkdownWarn" },
  important = { raw = "[!]", rendered = "󰀦", highlight = "RenderMarkdownWarn" },
  incomplete = { raw = "[/]", rendered = "󰡖", highlight = "RenderMarkdownUnchecked" },
  key = { raw = "[k]", rendered = "󰌆", highlight = "RenderMarkdownWarn" },
  location = { raw = "[l]", rendered = "󰍎", highlight = "RenderMarkdownError" },
  pros = { raw = "[p]", rendered = "󰔓", highlight = "RenderMarkdownSuccess" },
  question = { raw = "[?]", rendered = "󰮥", highlight = "RenderMarkdownWarn" },
  quote = { raw = '["]', rendered = "󰝗", highlight = "RenderMarkdownQuote" },
  savings = { raw = "[S]", rendered = "󱀇", highlight = "RenderMarkdownInfo" },
  scheduling = { raw = "[<]", rendered = "󰬥", highlight = "RenderMarkdownHint" },
  star = { raw = "[*]", rendered = "󰓎", highlight = "RenderMarkdownWarn" },
  up = { raw = "[u]", rendered = "󰔵", highlight = "RenderMarkdownSuccess" },
  win = { raw = "[w]", rendered = "󰔸", highlight = "RenderMarkdownWarn" },
}

--- Inspiration: https://help.obsidian.md/Editing+and+formatting/Callouts
---
---@alias my.render.md.callout.UserConfig { icon: string, highlight: string }
---
---@type { [string]: my.render.md.callout.UserConfig }
local MY_CALLOUT_OPTS = {
  abstract = { icon = "󱞏", highlight = "RenderMarkdownInfo" },
  summary = { icon = "󱞏", highlight = "RenderMarkdownInfo" },
  tldr = { icon = "󱞏", highlight = "RenderMarkdownInfo" },
  info = { icon = "󰋽", highlight = "RenderMarkdownInfo" },
  todo = { icon = "󰝖", highlight = "RenderMarkdownTodo" },
  hint = { icon = "󰌶", highlight = "RenderMarkdownHint" },
  success = { icon = "󰡕", highlight = "RenderMarkdownSuccess" },
  check = { icon = "󰡕", highlight = "RenderMarkdownSuccess" },
  done = { icon = "󰡕", highlight = "RenderMarkdownSuccess" },
  question = { icon = "󰘥", highlight = "RenderMarkdownWarn" },
  help = { icon = "󰘥", highlight = "RenderMarkdownWarn" },
  faq = { icon = "󰘥", highlight = "RenderMarkdownWarn" },
  attention = { icon = "󰀪", highlight = "RenderMarkdownWarn" },
  failure = { icon = "󰛉", highlight = "RenderMarkdownError" },
  fail = { icon = "󰛉", highlight = "RenderMarkdownError" },
  missing = { icon = "󰛉", highlight = "RenderMarkdownError" },
  danger = { icon = "󱐌", highlight = "RenderMarkdownError" },
  error = { icon = "󱐌", highlight = "RenderMarkdownError" },
  bug = { icon = "󰨰", highlight = "RenderMarkdownError" },
  example = { icon = "󰉹", highlight = "RenderMarkdownHint" },
  quote = { icon = "󱆧", highlight = "RenderMarkdownQuote" },
  cite = { icon = "󱆧", highlight = "RenderMarkdownQuote" },
}

---@module "render-markdown"
---@param aggregate_callout_opts { [string]: render.md.callout.UserConfig }
---@param callout_key string
---@param callout_opts my.render.md.callout.UserConfig
---@return render.md.callout.UserConfig
local function my_callout_opts_reducer(aggregate_callout_opts, callout_key, callout_opts)
  return vim.tbl_deep_extend("keep", aggregate_callout_opts, {
    [callout_key] = {
      raw = string.format("[!%s]", string.upper(callout_key)),
      rendered = string.format("%s %s", callout_opts.icon, my_utils.title_case(callout_key)),
      highlight = callout_opts.highlight,
      category = "obsidian",
    },
  })
end

return {
  checkbox_opts = MY_CHECKBOX_OPTS,
  callout_opts = vim.iter(MY_CALLOUT_OPTS):fold({}, my_callout_opts_reducer),
}
