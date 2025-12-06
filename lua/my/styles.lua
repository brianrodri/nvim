--- Inspiration: https://publish.obsidian.md/tasks/Reference/Status+Collections/Minimal+Theme#Supported+statuses
---
---@module "render-markdown"
---@type table<string, render.md.checkbox.custom.UserConfig>
-- stylua: ignore
local MY_RENDER_MARKDOWN_CHECKBOX_OPTS = {
  bookmark    = { raw = "[b]", rendered = "󰃀", highlight = "RenderMarkdownInfo"      },
  canceled    = { raw = "[-]", rendered = "󱋬", highlight = "RenderMarkdownDash"      },
  cons        = { raw = "[c]", rendered = "󰔑", highlight = "RenderMarkdownError"     },
  down        = { raw = "[d]", rendered = "󰔳", highlight = "RenderMarkdownError"     },
  fire        = { raw = "[f]", rendered = "󰈸", highlight = "RenderMarkdownError"     },
  forwarded   = { raw = "[>]", rendered = "󰒊", highlight = "RenderMarkdownHint"      },
  hint        = { raw = "[h]", rendered = "󰌶", highlight = "RenderMarkdownHint"      },
  idea        = { raw = "[i]", rendered = "󰛨", highlight = "RenderMarkdownWarn"      },
  important   = { raw = "[!]", rendered = "󰀦", highlight = "RenderMarkdownWarn"      },
  incomplete  = { raw = "[/]", rendered = "󱞇", highlight = "RenderMarkdownUnchecked" },
  key         = { raw = "[k]", rendered = "󰌆", highlight = "RenderMarkdownWarn"      },
  location    = { raw = "[l]", rendered = "󰍎", highlight = "RenderMarkdownError"     },
  pros        = { raw = "[p]", rendered = "󰔓", highlight = "RenderMarkdownSuccess"   },
  question    = { raw = "[?]", rendered = "󰮥", highlight = "RenderMarkdownWarn"      },
  quote       = { raw = '["]', rendered = "󰝗", highlight = "RenderMarkdownUnchecked" },
  savings     = { raw = "[S]", rendered = "󱀇", highlight = "RenderMarkdownInfo"      },
  scheduling  = { raw = "[<]", rendered = "󰬥", highlight = "RenderMarkdownHint"      },
  star        = { raw = "[*]", rendered = "󰓎", highlight = "RenderMarkdownWarn"      },
  up          = { raw = "[u]", rendered = "󰔵", highlight = "RenderMarkdownSuccess"   },
  win         = { raw = "[w]", rendered = "󰔸", highlight = "RenderMarkdownWarn"      },
}

--- Inspiration: https://help.obsidian.md/Editing+and+formatting/Callouts
---
---@alias my.CalloutOpts { icon: string }
---
---@type { [string]: my.CalloutOpts }
-- stylua: ignore
local MY_RENDER_MARKDOWN_CALLOUT_OPTS = {
  abstract =  { icon = "󱞏" },
  attention = { icon = "󰀪" },
  bug =       { icon = "󰨰" },
  check =     { icon = "󰡕" },
  cite =      { icon = "󱆧" },
  danger =    { icon = "󱐌" },
  done =      { icon = "󰡕" },
  error =     { icon = "󱐌" },
  example =   { icon = "󰉹" },
  fail =      { icon = "󰛉" },
  failure =   { icon = "󰛉" },
  faq =       { icon = "󰘥" },
  help =      { icon = "󰘥" },
  hint =      { icon = "󰌶" },
  info =      { icon = "󰋽" },
  missing =   { icon = "󰛉" },
  question =  { icon = "󰘥" },
  quote =     { icon = "󱆧" },
  success =   { icon = "󰡕" },
  summary =   { icon = "󱞏" },
  tldr =      { icon = "󱞏" },
  todo =      { icon = "󰝖" },
}

---@module "render-markdown"
---@param user_configs render.md.callout.UserConfigs
---@param callout_name string
---@param my_callout_opts my.CalloutOpts
---@return render.md.callout.UserConfigs callout_configs
local function callout_opts_reducer(user_configs, callout_name, my_callout_opts)
  return vim.tbl_deep_extend("force", user_configs, {
    [callout_name] = {
      raw = string.format("[!%s]", string.upper(callout_name)),
      rendered = string.format("%s %s", my_callout_opts.icon, string.upper(callout_name)),
      category = "obsidian",
    },
  })
end

return {
  ---@type table<string, render.md.checkbox.custom.UserConfig>
  RENDER_MARKDOWN_CHECKBOX_OPTS = vim.deepcopy(MY_RENDER_MARKDOWN_CHECKBOX_OPTS),
  ---@type render.md.callout.UserConfigs
  RENDER_MARKDOWN_CALLOUT_OPTS = vim.iter(MY_RENDER_MARKDOWN_CALLOUT_OPTS):fold({}, callout_opts_reducer),
}
