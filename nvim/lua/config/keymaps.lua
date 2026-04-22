-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

map({ "n", "v" }, "gh", "^", { desc = "Go to first non-blank character" })
map({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })

map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "New terminal" })

map("t", "<S-h>", [[<C-\><C-n><cmd>bprevious<cr>]])
map("t", "<S-l>", [[<C-\><C-n><cmd>bnext<cr>]])
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])
map("t", "<Esc><Esc>", [[<C-\><C-n>]])
