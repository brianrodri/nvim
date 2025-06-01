return {
  ---@module "snacks"
  ---@type snacks.input.Config|{}
  config = {
    win = {
      relative = "cursor",
      row = -3,
      col = 0,
      keys = {
        i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
        ctrl_f = { "<c-f>", { "cmp_close", "<esc>" }, mode = "i", expr = true },
      },
    },
  },
}
