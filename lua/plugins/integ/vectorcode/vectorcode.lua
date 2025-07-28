---@module "lazy"
---@type LazySpec
return {
  {
    "Davidyz/VectorCode",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "uv tool upgrade vectorcode",
    cmd = "VectorCode",
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = { "Davidyz/VectorCode" },
    opts = {
      extensions = {
        vectorcode = {
          ---@module "vectorcode"
          ---@type VectorCode.CodeCompanion.ExtensionOpts|{}
          opts = {
            ---@module "vectorcode"
            ---@type VectorCode.CodeCompanion.ToolGroupOpts|{}
            tool_group = { enabled = true },
          },
        },
      },
    },
  },
}
