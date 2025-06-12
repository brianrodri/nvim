---@module "lazy"
---@type LazySpec
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    ---@param opts my.types.LintOpts|?
    config = function(_, opts)
      -- Configure the linters.
      require("lint").linters_by_ft = opts and opts.linters_by_ft or {}
      -- Setup automatic linting for buffers.
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("my.lint.autocmd", { clear = true }),
        callback = function()
          local ok, lint = pcall(require, "lint")
          if ok and vim.opt_local.modifiable:get() then lint.try_lint() end
        end,
      })
    end,
  },
}
