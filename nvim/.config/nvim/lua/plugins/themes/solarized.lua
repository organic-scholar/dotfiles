return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    palette = "solarized", -- solarized (default) | selenized
    variant = "winter", -- "spring" | "summer" | "autumn" | "winter" (default)
  },
  config = function(_, opts)
    require("solarized").setup(opts)
    vim.cmd.colorscheme("solarized")
  end,
}
