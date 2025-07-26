local global_lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
global_lsp_capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolvedSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts my.types.LspConfig|?
    config = function(_, opts)
      vim.lsp.config("*", { capabilities = global_lsp_capabilities })
      for name, config in pairs(opts or {}) do
        if config then vim.lsp.enable(name, true) end
        if type(config) == "table" and not vim.tbl_isempty(config) then vim.lsp.config(name, config) end
      end
    end,
  },
}
