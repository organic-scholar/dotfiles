local add = MiniDeps.add
local map = vim.keymap.set

add({
  source = "https://github.com/folke/flash.nvim",
  checkout = "v2.1.0",
})

require("flash").setup()

map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
