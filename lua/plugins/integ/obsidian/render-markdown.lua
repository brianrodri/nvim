local my_styles = require("my.render-markdown-styles")

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "MeanderingProgrammer/render-markdown.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts|{}
    opts = { ui = { enable = false } },
    config = function(_, opts)
      require("obsidian").setup(opts)
      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Keymaps#remove-default-mapping
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_create_autocmd("User", {
        pattern = "ObsidianNoteEnter",
        callback = function(ev) vim.keymap.del("n", "<CR>", { buffer = ev.buf }) end,
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { preset = "obsidian", callout = my_styles.callout_opts, checkbox = my_styles.checkbox_opts },
    config = function(_, opts)
      opts = vim.tbl_deep_extend("keep", { checkbox = { custom = {} } }, opts or {})
      opts.checkbox.custom.todo = nil
      require("render-markdown").setup(opts)
    end,
  },
}
