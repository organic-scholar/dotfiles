return {
  {
    "Shatur/neovim-ayu",
    branch = "master",
    config = function()
      require("ayu").setup({})
      vim.cmd.colorscheme("ayu-dark")
    end,
  },
}
