local add = MiniDeps.add
local map = vim.keymap.set

add({
  source = "NeogitOrg/neogit",
  checkout = "master",
  depends = {
    -- { source = "sindrets/diffview.nvim", checkout = "main" },
    { source = "esmuellert/codediff.nvim", checkout = "v2.43.15" },
  },
})

require("neogit").setup({
  mappings = {
    status = {
      ["o"] = "Toggle",
    },
  },
})

map("n", "<leader>gg", function()
  require("neogit").open({})
end, { desc = "Open Neogit UI" })
