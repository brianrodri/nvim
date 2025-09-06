local my_styles = require("my.render-markdown-styles")

---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts|{}
    opts = {
      -- :help render-markdown-info-obsidian.nvim
      ui = { enable = false },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Keymaps#remove-default-mapping
      vim.api.nvim_create_autocmd("User", {
        pattern = "ObsidianNoteEnter",
        callback = function(ev) vim.keymap.del("n", "<CR>", { buffer = ev.buf }) end,
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = { preset = "obsidian", callout = my_styles.callout_opts, checkbox = my_styles.checkbox_opts },
    ---@module "render-markdown"
    ---@param opts render.md.UserConfig|?
    config = function(_, opts)
      opts = vim.tbl_deep_extend("keep", { checkbox = { custom = {} } }, opts or {})
      opts.checkbox.custom.todo = nil
      require("render-markdown").setup(opts)
    end,
  },
}
