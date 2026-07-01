return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  opts = {

    override = function(scheme)
      return {
        WinSeparator = { fg = scheme.base.dimmed3 },
      }
    end,
  },
  config = function(_, opts)
    require("monokai-pro").setup(opts)

    vim.cmd.colorscheme("monokai-pro-spectrum")
  end,
}
