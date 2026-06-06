MiniDeps.add({
  source = "https://github.com/folke/tokyonight.nvim",
  checkout = "v4.14.1",
})

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
