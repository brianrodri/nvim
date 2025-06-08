---@module "lazy"
---@type LazySpec
return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    version = false,
    build = "make",
    ---@module "avante"
    ---@type avante.Config|{}
    opts = {
      provider = "claude",
      input = { provider = "snacks" },
    },
    enabled = vim.fn.getenv("ANTHROPIC_API_KEY") ~= nil,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AvanteViewBufferUpdated",
        callback = function(evt) require("render-markdown.core.manager").set_buf(evt.buf, true) end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = { "AvanteEditSubmitted", "AvanteInputSubmitted" },
        callback = function(evt) require("render-markdown.core.manager").set_buf(evt.buf, false) end,
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = { file_types = { "Avante" } },
    opts_extend = { "file_types" },
  },
}
