local add = MiniDeps.add

add({
  source = "https://github.com/nvim-lualine/lualine.nvim",
  checkout = "master",
})

require("lualine").setup({
  options = {
    theme = "tokyonight-night",
  },
})
