return {
  "deparr/tairiki.nvim",
  lazy = false,
  priority = 1000, -- recommended if you use tairiki as your default theme
  config = function()
    require("tairiki").setup({
      -- palette definitions are in lua/tairiki/palette
      colors = function(c, opts)
        if opts.palette == "dark" then
          c.bg = "#1d1f21"
          c.comment = "#969896"
          c.bg_light = "#282a2e"
          c.bg_light2 = "#323435"
          c.bg_light3 = "#373b41"
          c.bg_light4 = "#494e56"
          c.fg_dark = "#afb2b0"
          c.fg_dark2 = "#969896"
          c.fg_dark3 = "#858886"
        end
      end,
      palette = "dark", -- main palette, available options: dark, light, dimmed, tomorrow, light_legacy

      highlights = function(hl, c, _)
        hl["BlinkCmpGhostText"] = { fg = c.comment }
        hl["@lsp.type"] = { fg = c.red }
        hl["@lsp.type.variable"] = { fg = c.red }
        -- hl["@lsp.type.struct"] = { fg = c.fg }
        hl["@lsp.type.property"] = { fg = c.red }
        hl["Macro"] = { fg = c.blue }
        hl["@lsp.type.enumMember"] = { fg = c.blue }
      end,
    })
    vim.cmd.colorscheme("tairiki")
  end,
}
