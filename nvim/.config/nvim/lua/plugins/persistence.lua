return {
  {
    "folke/persistence.nvim",
    branch = "v3.1.0",
    config = function()
      local map = vim.keymap.set
      require("persistence").setup({
        dir = vim.fn.stdpath("state") .. "/sessions/",
        need = 1,
        branch = true,
      })

      map("n", "<leader>ps", function() require("persistence").load() end, { desc = "Restore Session" })
      map("n", "<leader>pS", function() require("persistence").select() end, { desc = "Select session" })
      map("n", "<leader>pl", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
      map("n", "<leader>pd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })

      vim.api.nvim_create_autocmd("VimEnter", {
        nested = true,
        callback = function()
          if vim.fn.argc() == 0 and not vim.g.kitty_scrollback then require("persistence").load() end
        end,
      })
    end,
  },
}
