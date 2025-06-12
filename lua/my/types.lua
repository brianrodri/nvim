---@alias my.LintOpts { linters_by_ft: { [string]: string[] } }

---@alias my.LspConfig { [string]: vim.lsp.Config|boolean|? }

---@alias my.TSConfig TSConfig | { [string]: TSModule|{} }
