---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      ensure_installed = { "markdown", "markdown_inline" },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { markdown = { "prettier" } } },
  },

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
      checkbox = {
        checked = { icon = "󰱒 ", highlight = "@text.todo.checked", scope_highlight = "@markup.strikethrough" },
        unchecked = { icon = "󰄱 ", highlight = "@text.todo.unchecked" },
        custom = {
          todo = { raw = "[-]", rendered = "󰛲 ", highlight = "@error", scope_highlight = "@markup.strikethrough" },
          mood = { raw = "[=]", rendered = "󰋓 ", highlight = "Purple", scope_highlight = "PurpleItalic" },
        },
        right_pad = 0,
      },
    },
    opts_extend = { "file_types" },
  },

  {
    "neovim/nvim-lspconfig",
    ---@type my.LspConfig
    opts = {
      markdown_oxide = {
        root_markers = { ".obsidian" },
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    ---@type my.LintOpts
    opts = { linters_by_ft = { markdown = { "markdownlint" } } },
  },
}
