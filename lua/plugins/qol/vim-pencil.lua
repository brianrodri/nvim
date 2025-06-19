---@module "lazy"
---@type LazySpec
return {
  {
    "preservim/vim-pencil",
    dependencies = { "folke/snacks.nvim" },
    ft = "markdown",
    config = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("vim-pencil-toggle", { clear = true }),
        pattern = { "*.md" },
        callback = function()
          vim.cmd([[call pencil#init({'wrap': 'soft', 'autoformat': 1})]])
        end,
      })
    end,
  },
}
