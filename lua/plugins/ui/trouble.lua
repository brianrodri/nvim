vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp.trouble.keymaps", { clear = true }),
  callback = function(ev)
    local trouble = require("trouble")
    -- stylua: ignore
    -- luacheck: no max line length
    require("which-key").add({
      { "<leader>c*", function() trouble.toggle("lsp_references") end,       desc = "References",       buffer = ev.buf },
      { "<leader>cd", function() trouble.toggle("lsp_definitions") end,      desc = "Definitions",      buffer = ev.buf },
      { "<leader>ci", function() trouble.toggle("lsp_implementations") end,  desc = "Implementations",  buffer = ev.buf },
      { "<leader>cy", function() trouble.toggle("lsp_declarations") end,     desc = "Declaration",      buffer = ev.buf },
      { "<leader>ct", function() trouble.toggle("lsp_type_definitions") end, desc = "Type Definition",  buffer = ev.buf },
      { "<leader>cs", function() trouble.toggle("lsp_document_symbols") end, desc = "Document Symbols", buffer = ev.buf },
      { "<leader>cj", function() trouble.toggle("lsp_incoming_calls") end,   desc = "Incoming Calls",   buffer = ev.buf },
      { "<leader>ck", function() trouble.toggle("lsp_outgoing_calls") end,   desc = "Outgoing Calls",   buffer = ev.buf },
    })
  end,
})

---@module "lazy"
---@type LazySpec
return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    ---@type trouble.Config|{}
    opts = {
      focus = true,
      follow = false,
      warn_no_results = false,
      open_no_results = true,
      restore = false,
      modes = {
        lsp_base = {
          params = { include_current = true },
        },
        lsp_document_symbols = {
          mode = "lsp_document_symbols",
          win = { position = "right", size = 112, minimal = true },
        },
      },
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
    },
  },
}
