return {
  {
    "nvim-lualine/lualine.nvim",
    branch = "master",
    config = function() require("lualine").setup({ options = { theme = "auto" } }) end,
  },
}
