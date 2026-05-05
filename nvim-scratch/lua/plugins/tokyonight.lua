MiniDeps.add({
  source = "https://github.com/folke/tokyonight.nvim",
  checkout = "v4.14.1",
})

require("tokyonight").setup()

vim.cmd.colorscheme("tokyonight-night")

