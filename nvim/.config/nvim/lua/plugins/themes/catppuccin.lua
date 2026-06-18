return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      highlight_overrides = {
        mocha = function(mocha)
          return {
            WinSeparator = { fg = mocha.surface1 },
          }
        end,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
