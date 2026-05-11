MiniDeps.add({
  source = "rebelot/kanagawa.nvim",
  checkout = "master",
})

require("kanagawa").setup({
  theme = "lotus",
})

vim.cmd.colorscheme("kanagawa")
