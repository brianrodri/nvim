---@alias my.types.LintOpts { linters_by_ft: { [string]: string[] } }

---@alias my.types.LspConfig { [string]: vim.lsp.Config|boolean|? }

---@module "nvim-treesitter"
---@alias my.types.TSConfig TSConfig | { [string]: TSModule|{} }
