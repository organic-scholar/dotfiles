return {
  {
    "saghen/blink.cmp",
    branch = "v1.10.2",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      signature = { enabled = true, window = { show_documentation = true } },
      cmdline = {
        keymap = { preset = "inherit" },
        completion = {
          menu = { auto_show = false },
          trigger = {},
          list = { selection = { preselect = true, auto_insert = false } },
          ghost_text = { enabled = true },
        },
      },
      keymap = {
        preset = "default",
        ["<Tab>"] = {
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
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<Right>"] = { "select_and_accept", "accept", "fallback" },
      },
      appearance = { use_nvim_cmp_as_default = false, nerd_font_variant = "mono" },
      completion = {
        menu = { border = "rounded", auto_show = false, draw = { align_to = "cursor", treesitter = { "lsp" } } },
        trigger = { show_in_snippet = false },
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
        ghost_text = { enabled = true, show_without_selection = true },
      },
      sources = { providers = { snippets = { opts = { friendly_snippets = true, extended_filetypes = {} } } } },
    },
  },
}
