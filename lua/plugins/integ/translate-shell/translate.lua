return {
  {
    "uga-rosa/translate.nvim",
    opts = {
      default = {
        command = "translate_shell",
        output = "split",
      },
    },
    keys = {
      { "<leader>rt", "<CMD>Translate zh-CN<CR>", desc = "Translate (to CN)", mode = { "n", "x" } },
    },
  },
}
