local add = MiniDeps.add
local map = vim.keymap.set

add({
  source = "folke/flash.nvim",
  checkout = "v2.1.0",
})

require("flash").setup({
  -- modes = {
  --   char = {
  --     enabled = true,
  --   },
  -- },
})

-- map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })

map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })

map(
  { "n", "x", "o" },
  "f",
  function()
    require("flash").jump({
      search = { forward = true, wrap = false, multi_window = false },
    })
  end,
  { desc = "Flash" }
)

map(
  { "n", "x", "o" },
  "F",
  function()
    require("flash").jump({
      search = { forward = false, wrap = false, multi_window = false },
    })
  end,
  { desc = "Flash" }
)
