---@module "which-key"
---@type wk.Spec
return {
  { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename Symbol" },
  { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Action", mode = { "n", "x" } },
  { "<leader>c*", function() require("trouble").toggle("lsp_references") end, desc = "References" },
  { "<leader>cd", function() require("trouble").toggle("lsp_declarations") end, desc = "Declaration" },
  { "<leader>cD", function() require("trouble").toggle("lsp_implementations") end, desc = "Implementations" },
  { "<leader>cy", function() require("trouble").toggle("lsp_definitions") end, desc = "Definitions" },
  { "<leader>cY", function() require("trouble").toggle("lsp_type_definitions") end, desc = "Type Definitions" },
  { "<leader>cs", function() require("trouble").toggle("my_lsp_document_symbols") end, desc = "Document Symbols" },
  { "<leader>cj", function() require("trouble").toggle("lsp_incoming_calls") end, desc = "Incoming Calls" },
  { "<leader>ck", function() require("trouble").toggle("lsp_outgoing_calls") end, desc = "Outgoing Calls" },
}
