return {
  ---@module "snacks"
  ---@type snacks.input.Config|{}
  config = {
    win = {
      keys = {
        i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
        ctrl_f = { "<c-f>", { "cmp_close", "<esc>" }, mode = "i", expr = true },
      },
    },
  },
}
