local noice_status_lualine_section = {
  function() return require("noice").api.status.search.get() end,
  cond = function() return require("noice").api.status.search.has() end,
}

---@module "lazy"
---@type LazySpec
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    ---@module "noice"
    ---@type NoiceConfig|{}
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      views = { mini = { position = { row = 0, col = "100%" }, reverse = false } },
      messages = { view = "mini", view_warn = "mini" },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",

      {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "bash" } },
        opts_extend = { "ensure_installed" },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = { sections = { lualine_c = { noice_status_lualine_section } } },
    opts_extend = { "sections.lualine_c" },
  },
}
