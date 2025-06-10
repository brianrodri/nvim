---@class my.LintOpts
---@field linters_by_ft { [string]: string[] }

-- Automatically lint on-write
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("my.autolint", { clear = true }),
  callback = function()
    local ok, lint = pcall(require, "lint")
    if ok and vim.opt_local.modifiable:get() then lint.try_lint() end
  end,
})

---@module "lazy"
---@type LazySpec
return { -- Linting
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  ---@param opts my.LintOpts
  config = function(_, opts) require("lint").linters_by_ft = vim.tbl_get(opts or {}, "linters_by_ft") or {} end,
}
