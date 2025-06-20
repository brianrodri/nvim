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
      preset = "obsidian",
      bullet = { icons = { "󰍴 " }, right_pad = 0, highlight = "@comment" },
      -- TODO: Dedupe these settings using `my.todo_comments`.
      -- stylua: ignore
      -- luacheck: no max line length
      callout = {
        note      = { raw = "[!NOTE]",      rendered = "󰲶 Note",      highlight = "RenderMarkdownInfo",    category = "obsidian" },
        abstract  = { raw = "[!ABSTRACT]",  rendered = "󰨸 Abstract",  highlight = "RenderMarkdownSuccess", category = "obsidian" },
        summary   = { raw = "[!SUMMARY]",   rendered = "󰨸 Summary",   highlight = "RenderMarkdownSuccess", category = "obsidian" },
        tldr      = { raw = "[!TLDR]",      rendered = "󰨸 TL;DR",     highlight = "RenderMarkdownSuccess", category = "obsidian" },
        info      = { raw = "[!INFO]",      rendered = "󰋽 Info",      highlight = "RenderMarkdownInfo",    category = "obsidian" },
        todo      = { raw = "[!TODO]",      rendered = "󰗡 Todo",      highlight = "RenderMarkdownInfo",    category = "obsidian" },
        tip       = { raw = "[!TIP]",       rendered = "󰈸 Tip",       highlight = "RenderMarkdownSuccess", category = "obsidian" },
        hint      = { raw = "[!HINT]",      rendered = "󰈸 Hint",      highlight = "RenderMarkdownSuccess", category = "obsidian" },
        important = { raw = "[!IMPORTANT]", rendered = "󰈸 Important", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        success   = { raw = "[!SUCCESS]",   rendered = "󰄬 Success",   highlight = "RenderMarkdownHint",    category = "obsidian" },
        check     = { raw = "[!CHECK]",     rendered = "󰄬 Check",     highlight = "RenderMarkdownHint",    category = "obsidian" },
        done      = { raw = "[!DONE]",      rendered = "󰄬 Done",      highlight = "RenderMarkdownHint",    category = "obsidian" },
        question  = { raw = "[!QUESTION]",  rendered = "󰘥 Question",  highlight = "RenderMarkdownWarn",    category = "obsidian" },
        help      = { raw = "[!HELP]",      rendered = "󰘥 Help",      highlight = "RenderMarkdownWarn",    category = "obsidian" },
        faq       = { raw = "[!FAQ]",       rendered = "󰘥 FAQ",       highlight = "RenderMarkdownWarn",    category = "obsidian" },
        warning   = { raw = "[!WARNING]",   rendered = "󰀪 Warning",   highlight = "RenderMarkdownWarn",    category = "obsidian" },
        caution   = { raw = "[!CAUTION]",   rendered = "󰀪 Caution",   highlight = "RenderMarkdownWarn",    category = "obsidian" },
        attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn",    category = "obsidian" },
        failure   = { raw = "[!FAILURE]",   rendered = "󰅖 Failure",   highlight = "RenderMarkdownError",   category = "obsidian" },
        fail      = { raw = "[!FAIL]",      rendered = "󰅖 Fail",      highlight = "RenderMarkdownError",   category = "obsidian" },
        missing   = { raw = "[!MISSING]",   rendered = "󰅖 Missing",   highlight = "RenderMarkdownError",   category = "obsidian" },
        danger    = { raw = "[!DANGER]",    rendered = "󱐌 Danger",    highlight = "RenderMarkdownError",   category = "obsidian" },
        error     = { raw = "[!ERROR]",     rendered = "󱐌 Error",     highlight = "RenderMarkdownError",   category = "obsidian" },
        bug       = { raw = "[!BUG]",       rendered = "󰨰 Bug",       highlight = "RenderMarkdownError",   category = "obsidian" },
        example   = { raw = "[!EXAMPLE]",   rendered = "󰉹 Example",   highlight = "Purple",                category = "obsidian" },
        quote     = { raw = "[!QUOTE]",     rendered = "󱆨 Quote",     highlight = "RenderMarkdownQuote",   category = "obsidian" },
        cite      = { raw = "[!CITE]",      rendered = "󱆨 Cite",      highlight = "RenderMarkdownQuote",   category = "obsidian" },
      },
      -- stylua: ignore
      -- luacheck: no max line length
      checkbox = {
        checked = { icon = "󰱒 ", highlight = "@text.todo.checked", scope_highlight = "@markup.strikethrough" },
        unchecked = { icon = "󰄱 ", highlight = "@text.todo.unchecked" },
        custom = {
          incomplete  = { raw = "[/]", rendered = "󰤌 ", highlight = "Green" },
          todo        = { raw = "[-]", rendered = "󱋭 ", highlight = "Comment", scope_highlight = "@markup.strikethrough" },
          forwarded   = { raw = "[>]", rendered = "󰒊 ", highlight = "Comment" },
          scheduled   = { raw = "[<]", rendered = "󰃮 ", highlight = "Comment" },
          question    = { raw = "[?]", rendered = "󰞋 ", highlight = "Yellow" },
          important   = { raw = "[!]", rendered = "󰀦 ", highlight = "Orange" },
          star        = { raw = "[*]", rendered = "󰓎 ", highlight = "Yellow" },
          quote       = { raw = '["]', rendered = "󱀡 ", highlight = "Comment" },
          location    = { raw = "[l]", rendered = "󰍎 ", highlight = "Red" },
          bookmark    = { raw = "[b]", rendered = "󰃀 ", highlight = "Orange" },
          information = { raw = "[i]", rendered = "󰬐 ", highlight = "Blue" },
          savings     = { raw = "[S]", rendered = "󰇁 ", highlight = "Green" },
          idea        = { raw = "[I]", rendered = "󰛨 ", highlight = "Yellow" },
          pros        = { raw = "[p]", rendered = "󰔓 ", highlight = "Green" },
          cons        = { raw = "[c]", rendered = "󰔑 ", highlight = "Orange" },
          fire        = { raw = "[f]", rendered = "󰈸 ", highlight = "Red" },
          key         = { raw = "[k]", rendered = "󰌆 ", highlight = "Yellow" },
          win         = { raw = "[w]", rendered = "󰃫 ", highlight = "Purple" },
          up          = { raw = "[u]", rendered = "󰔵 ", highlight = "Green" },
          down        = { raw = "[d]", rendered = "󰔳 ", highlight = "Red" },
        },
        right_pad = 0,
      },
    },
    opts_extend = { "file_types" },
  },
}
