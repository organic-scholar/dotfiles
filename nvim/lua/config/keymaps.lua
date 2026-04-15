-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

map({ "n", "v" }, "gh", "^", { desc = "Go to first non-blank character" })
map({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
