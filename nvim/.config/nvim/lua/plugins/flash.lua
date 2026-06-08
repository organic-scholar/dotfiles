return {
  {
    "folke/flash.nvim",
    branch = "v2.1.0",
    config = function()
      local map = vim.keymap.set
      require("flash").setup({})

      map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
      map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
      map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })

      map(
        { "n", "x", "o" },
        "f",
        function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } }) end,
        { desc = "Flash" }
      )

      map(
        { "n", "x", "o" },
        "F",
        function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } }) end,
        { desc = "Flash" }
      )
    end,
  },
}
