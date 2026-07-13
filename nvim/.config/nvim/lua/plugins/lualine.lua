return {
  {
    "nvim-lualine/lualine.nvim",
    branch = "master",
    config = function()
      require("lualine").setup({

        options = { theme = "auto" },
        sections = {
          lualine_c = {
            {
              function() return require("dap").status() end,
              icon = { "", color = { fg = "#e7c664" } }, -- nerd icon.
              cond = function()
                if not package.loaded.dap then return false end
                local session = require("dap").session()
                return session ~= nil
              end,
            },
          },
        },
      })
    end,
  },
}
