vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("my.render-markdown.highlights", { clear = true }),
  pattern = "LazyDone",
  callback = function()
    vim.api.nvim_set_hl(0, "my.todo.obsolete", { ctermfg = 245, fg = "#859289", strikethrough = true, force = true })
    vim.api.nvim_set_hl(0, "my.todo.done", { ctermfg = 142, fg = "#A7C080", strikethrough = true, force = true })
  end,
})

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
        quote     = { raw = "[!QUOTE]",     rendered = "󱆨 Quote",     highlight = "markdownBlockquote",    category = "obsidian" },
        cite      = { raw = "[!CITE]",      rendered = "󱆨 Cite",      highlight = "markdownBlockquote",    category = "obsidian" },
      },
      -- stylua: ignore
      -- luacheck: no max line length
      checkbox = {
        checked = { icon = "󰱒 ", highlight = "RenderMarkdownHint", scope_highlight = "my.todo.obsolete" },
        unchecked = { icon = "󰄱 " },
        custom = {
          quote       = { raw = '["]', rendered = "󱀡 ", highlight = "RenderMarkdownMath"                                          },
          todo        = { raw = "[-]", rendered = "󰄱 ", highlight = "my.todo.obsolete",      scope_highlight = "my.todo.obsolete" },
          important   = { raw = "[!]", rendered = "󰀦 ", highlight = "@tag"                                                        },
          question    = { raw = "[?]", rendered = "󰞋 ", highlight = "RenderMarkdownWarn"                                          },
          star        = { raw = "[*]", rendered = "󰓎 ", highlight = "RenderMarkdownWarn"                                          },
          incomplete  = { raw = "[/]", rendered = "󱂪 ", highlight = "RenderMarkdownHint"                                          },
          scheduled   = { raw = "[<]", rendered = "󰃮 ", highlight = "markdownBlockquote"                                          },
          forwarded   = { raw = "[>]", rendered = "󰒊 ", highlight = "markdownBlockquote"                                          },
          bookmark    = { raw = "[b]", rendered = "󰃀 ", highlight = "@tag"                                                        },
          cons        = { raw = "[c]", rendered = "󰔑 ", highlight = "@tag"                                                        },
          down        = { raw = "[d]", rendered = "󰔳 ", highlight = "RenderMarkdownError"                                         },
          fire        = { raw = "[f]", rendered = "󰈸 ", highlight = "RenderMarkdownError"                                         },
          key         = { raw = "[k]", rendered = "󰌋 ", highlight = "RenderMarkdownWarn"                                          },
          location    = { raw = "[l]", rendered = "󰍎 ", highlight = "RenderMarkdownError"                                         },
          pros        = { raw = "[p]", rendered = "󰔓 ", highlight = "RenderMarkdownHint"                                          },
          savings     = { raw = "[S]", rendered = " ", highlight = "RenderMarkdownHint"                                          },
          up          = { raw = "[u]", rendered = "󰔵 ", highlight = "RenderMarkdownHint"                                          },
          win         = { raw = "[w]", rendered = "󰃫 ", highlight = "Purple"                                                      },
          -- TODO: render-markdown can't distingusih between these two.
          information = { raw = "[i]", rendered = "󰋽 ", highlight = "RenderMarkdownInfo"                                          },
          idea        = { raw = "[I]", rendered = "󰛨 ", highlight = "RenderMarkdownWarn"                                          },
        },
        right_pad = 0,
      },
    },
    opts_extend = { "file_types" },
  },
}
