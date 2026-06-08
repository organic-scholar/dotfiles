local map = vim.keymap.set

map("n", "<space>", "q:", { desc = "Command" })

-- Window navigation
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

-- Quit
map("n", "<leader>q", "<cmd>wall<CR><cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })

map("n", "<c-q>", "<cmd>wqall<CR>", { desc = "Quit All" })
map("n", "<leader>r", "<cmd>wall<CR><cmd>restart<CR>", { desc = "Restart" })

-- Splits
map({ "n", "i" }, "<c-o>", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map({ "n", "i" }, "<c-,>", "<cmd>split<CR>", { desc = "Horizontal Split" })

-- Terminal
-- map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "New terminal" })
map("t", "<Esc><Esc>", [[<C-\><C-n>]])

map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete Buffer" })

map("n", "<leader>fn", function()
  local name = vim.fn.input("New file: ")
  vim.cmd("edit " .. name)
end, { desc = "New file" })

map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete Buffer" })
