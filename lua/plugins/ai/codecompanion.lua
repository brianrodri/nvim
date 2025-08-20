local GOLDEN_RATIO_INV = 2 / (1 + math.sqrt(5))

---@module "lazy"
---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      extensions = {
        history = { enabled = true },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_tools = true,
            show_server_tools_in_chat = true,
            add_mcp_prefix_to_tool_names = false,
            show_result_in_chat = true,
            format_tool = nil,
            make_vars = true,
            make_slash_commands = true,
          },
        },
      },
      display = {
        action_palette = {
          provider = "snacks",
          show_default_prompt_library = true,
        },
        window = {
          width = 1 - GOLDEN_RATIO_INV,
          height = GOLDEN_RATIO_INV,
        },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion: Actions", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompletion: Chat", mode = { "n", "v" } },
      { "<leader>af", "<cmd>CodeCompanionChat Add<cr>", desc = "CodeCompletion: Add File", mode = "v" },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = { file_types = { "codecompanion" } },
    opts_extend = { "file_types" },
  },
}
