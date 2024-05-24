return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.test.core" },
    {
        "jose-elias-alvarez/typescript.nvim",
        init = function()
            require("lazyvim.util").on_attach(function(_, bufnr)
                vim.keymap.set("n", "<leader><C-Y>", "OrganizeImports", { buffer = bufnr, desc = "Organize Imports" })
                vim.keymap.set("n", "<leader><C-R>", "RenameFile", { buffer = bufnr, desc = "Rename Module" })
            end)
        end,
        dependencies = {
            "neovim/nvim-lspconfig",
            opts = function(_, opts)
                vim.tbl_deep_extend("force", opts.servers, { tsserver = {} })
                vim.tbl_deep_extend("force", opts.setup, {
                    tsserver = function(_, setup_opts)
                        require("typescript").setup({ server = setup_opts })
                        return true
                    end,
                })
            end,
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-neotest/neotest-jest", "nvim-tree/nvim-web-devicons" },
        opts = function(_, opts)
            vim.list_extend(opts.adapters, { "neotest-jest" })
        end,
    },
}