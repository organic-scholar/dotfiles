local add = MiniDeps.add

add({
  source = "https://github.com/saghen/blink.cmp",
  checkout = "v1.10.2",
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    -- ["<CR>"] = {
    --   "accept",
    --   -- function() -- sidekick next edit suggestion
    --   --   return require("sidekick").nes_jump_or_apply()
    --   -- end,
    --   -- function()
    --   --   return vim.lsp.inline_completion.get()
    --   -- end,
    --   "fallback",
    -- },
    ["<Right>"] = {
      function()
        return vim.lsp.inline_completion.get()
      end,
      "fallback",
    },
  },
  completion = {
    menu = {
      auto_show = true,
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    ghost_text = {
      enabled = false,
    },
  },
})

local name = "blink.cmp"
