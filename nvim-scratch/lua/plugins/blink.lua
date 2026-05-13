local add = MiniDeps.add

add({
  source = "https://github.com/saghen/blink.cmp",
  checkout = "v1.10.2",
})

require("blink.cmp").setup({
  signature = {
    enabled = true,
    window = {
      show_documentation = true,
    },
  },
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
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
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  completion = {
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
      },
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = {
        -- Change 'rounded' to 'single' or 'double' if preferred
        -- border = "rounded",
        -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
    },
    ghost_text = {
      enabled = false,
    },
  },
})

local name = "blink.cmp"
