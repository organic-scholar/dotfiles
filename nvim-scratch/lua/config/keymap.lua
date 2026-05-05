local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>", { desc = "Write" })
map("n", "<space>", ":", { desc = "Write" })

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Quit
map("n", "<leader>qq", "<cmd>quit<CR>", { desc = "Quit" })
map("n", "<leader>qa", "<cmd>quitall<CR>", { desc = "Quit All" })
map("n", "<leader>qr", "<cmd>restart<CR>", { desc = "Restart" })

-- Splits
map({ "n", "i" }, "<c-o>", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
map({ "n", "i" }, "<c-,>", "<cmd>split<CR>", { desc = "Horizontal Split" })

-- Terminal
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "New terminal" })
map("t", "<Esc><Esc>", [[<C-\><C-n>]])
