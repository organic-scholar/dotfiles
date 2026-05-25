local add = MiniDeps.add

add({
  source = "saghen/blink.cmp",
  checkout = "v1.10.2",
})

add({
  source = "rafamadriz/friendly-snippets",
  checkout = "main",
})

require("blink.cmp").setup({
  signature = {
    enabled = true,
    window = {
      show_documentation = true,
    },
  },
  keymap = {
    preset = "super-tab",
    -- ["<Tab>"] = { "select_next", "fallback" },
    -- ["<S-Tab>"] = { "select_prev", "fallback" },
    -- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
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
    trigger = {
      show_in_snippet = false,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
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
  sources = {
    providers = {
      snippets = {
        opts = {
          friendly_snippets = true, -- default

          -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
          -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
          -- the following is just an example, you should only enable the frameworks that you use
          extended_filetypes = {},
        },
      },
    },
  },
})
