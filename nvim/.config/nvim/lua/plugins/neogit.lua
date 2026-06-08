return {
  {
    "NeogitOrg/neogit",
    branch = "master",
    dependencies = { { "esmuellert/codediff.nvim", branch = "v2.43.15" } },
    config = function()
      local map = vim.keymap.set
      require("neogit").setup({ mappings = { status = { ["o"] = "Toggle" } } })
      require("codediff").setup({ keymaps = { explorer = { select = "o" } } })

      map("n", "<leader>gg", function() require("neogit").open({}) end, { desc = "Open Neogit UI" })
      map("n", "<leader>gd", "<cmd>CodeDiff<CR>", { desc = "Open Code Diff" })
    end,
  },
}
