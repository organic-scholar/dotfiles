return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"] = {
        "accept",
        function()
          return LazyVim.cmp.actions.ai_accept()
        end,
        "fallback",
      },
      ["<Right>"] = {
        function()
          return LazyVim.cmp.actions.ai_accept()
        end,
        "fallback",
      },
    },
  },
}
