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
  cmdline = {
    keymap = { preset = "inherit" },
    completion = {
      menu = {
        auto_show = false,
      },
      trigger = {},
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
  keymap = {
    preset = "default",
    ["<Tab>"] = {
      -- cycle forward through items (ghost text only, no popup)
      function(cmp)
        if cmp.snippet_active() then return cmp.snippet_forward() end
        return cmp.select_next({ on_ghost_text = true })
      end,
      "fallback",
    },
    ["<S-Tab>"] = {
      function(cmp)
        if cmp.is_visible() then return cmp.select_prev() end
      end,
      "accept",
      "fallback",
    },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = {
      "select_and_accept",
      -- function() -- sidekick next edit suggestion
      --   return require("sidekick").nes_jump_or_apply()
      -- end,
      -- function()
      --   return vim.lsp.inline_completion.get()
      -- end,
      "fallback",
    },
    ["<Right>"] = {
      -- function(cmp) return cmp.select_next({ on_ghost_text = true }) end,
      "select_and_accept",
      "accept",
      "fallback",
    },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  completion = {
    menu = {
      border = "rounded",
      auto_show = false,
      draw = {
        align_to = "cursor",
        treesitter = { "lsp" },
      },
    },
    trigger = {
      show_in_snippet = false,
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
        border = "rounded",
        -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
    },
    ghost_text = {
      enabled = true,
      show_without_selection = true,
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
