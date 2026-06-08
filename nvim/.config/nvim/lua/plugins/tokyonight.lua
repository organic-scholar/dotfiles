return {
  {
    "folke/tokyonight.nvim",
    branch = "v4.14.1",
    config = function()
      require("tokyonight").setup({
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
