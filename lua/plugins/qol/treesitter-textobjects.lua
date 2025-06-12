---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    ---@type my.TSConfig
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ae"] = "@assignment.outer",
            ["ie"] = "@assignment.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            ["]a"] = "@parameter.inner",
            ["]c"] = "@class.outer",
            ["]e"] = "@assignment.outer",
            ["]f"] = "@function.outer",
          },
          goto_next_end = {
            ["]A"] = "@parameter.inner",
            ["]C"] = "@class.outer",
            ["]E"] = "@assignment.outer",
            ["]F"] = "@function.outer",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.inner",
            ["[c"] = "@class.outer",
            ["[e"] = "@assignment.outer",
            ["[f"] = "@function.outer",
          },
          goto_previous_end = {
            ["[A"] = "@parameter.inner",
            ["[C"] = "@class.outer",
            ["[E"] = "@assignment.outer",
            ["[F"] = "@function.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>cA"] = "@parameter.inner",
            ["<leader>cC"] = "@class.outer",
            ["<leader>cE"] = "@parameter.inner",
            ["<leader>cF"] = "@function.outer",
          },
        },
      },
    },
  },
}
