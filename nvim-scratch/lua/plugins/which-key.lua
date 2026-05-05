local add = MiniDeps.add

add({
  source = "https://github.com/folke/which-key.nvim",
  checkout = "v3.17.0",
})

require("which-key").setup({})