return {
  {
    "rebelot/kanagawa.nvim",
    branch = "master",
    config = function()
      require("kanagawa").setup({ theme = "lotus" })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
