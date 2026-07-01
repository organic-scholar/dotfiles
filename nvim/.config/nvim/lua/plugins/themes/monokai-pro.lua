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

    -- Flash.nvim highlight groups using monokai-pro palette
    -- local colors = require("monokai-pro.palette.spectrum")
    -- print(vim.inspect(colors))
    -- vim.api.nvim_set_hl(0, "FlashMatch", { bg = colors.background, fg = colors.accent, bold = true })
    -- vim.api.nvim_set_hl(0, "FlashLabel", { bg = colors.accent6, fg = colors.background, bold = true })
  end,
}
