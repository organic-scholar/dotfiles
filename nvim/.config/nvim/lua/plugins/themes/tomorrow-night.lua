return {
  "deparr/tairiki.nvim",
  lazy = false,
  priority = 1000, -- recommended if you use tairiki as your default theme
  config = function()
    require("tairiki").setup({
      palette = "tomorrow", -- main palette, available options: dark, light, dimmed, tomorrow, light_legacy
    })
    vim.cmd.colorscheme("tairiki")
  end,
}
