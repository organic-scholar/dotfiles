return {
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        custom_highlights = {
          -- WinBar = { link = "@property" },
          WinBar = { link = "Normal" },
          WinBarNC = { link = "Comment" },
        },
        plugins = {
          "blink",
          "flash",
          "neogit",
          "nvim-tree",
          "which-key",
          -- "telescope",
        },
      })
      vim.cmd.colorscheme("material-darker")
      -- vim.cmd.colorscheme("material-darker")
    end,
  },
}
