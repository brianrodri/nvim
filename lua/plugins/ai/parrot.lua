---@module "lazy"
---@type LazySpec
return {
  -- TODO: How do I get markdownlint to ignore parrot.nvim buffers, which happen to use markdown filetypes?

  {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua" },
    opts = {
      providers = {
        anthropic = {
          name = "anthropic",
          endpoint = "https://api.anthropic.com/v1/messages",
          model_endpoint = "https://api.anthropic.com/v1/models",
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          params = {
            chat = { max_tokens = 4096 },
            command = { max_tokens = 4096 },
          },
          topic = {
            model = "claude-3-5-haiku-latest",
            params = { max_tokens = 32 },
          },
          headers = function(self)
            return {
              ["Content-Type"] = "application/json",
              ["x-api-key"] = self.api_key,
              ["anthropic-version"] = "2023-06-01",
            }
          end,
          models = {
            "claude-sonnet-4-20250514",
            "claude-3-7-sonnet-20250219",
            "claude-3-5-sonnet-20241022",
            "claude-3-5-haiku-20241022",
          },
          preprocess_payload = function(payload)
            for _, message in ipairs(payload.messages) do
              message.content = message.content:gsub("^%s*(.-)%s*$", "%1")
            end
            if payload.messages[1] and payload.messages[1].role == "system" then
              -- remove the first message that serves as the system prompt as anthropic
              -- expects the system prompt to be part of the API call body and not the messages
              payload.system = payload.messages[1].content
              table.remove(payload.messages, 1)
            end
            return payload
          end,
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "parrot" },
        providers = {
          parrot = {
            module = "parrot.completion.blink",
            name = "parrot",
            opts = { show_hidden_files = false, max_items = 5 },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
