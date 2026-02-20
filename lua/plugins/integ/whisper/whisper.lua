return {
  {
    "Avi-D-coder/whisper.nvim",
    opts = {
      keybind = "<C-v>",
      manual_trigger_key = "<Space>",
      modes = { "i" },
      step_ms = 3000,
      length_ms = 5000,
    },
    keys = {
      { "<C-g>", mode = { "i" }, desc = "Speech-to-text" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "AndreM222/copilot-lualine" },
    opts = {
      sections = {
        lualine_x = { function() return require("whisper").lualine_component() end },
      },
    },
    opts_extend = { "sections.lualine_x" },
  },
}
