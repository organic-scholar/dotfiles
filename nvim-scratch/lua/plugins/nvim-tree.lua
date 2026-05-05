local add = MiniDeps.add

add({
  source = "https://github.com/nvim-tree/nvim-tree.lua",
  checkout = "v1.17.0",
})

require("nvim-tree").setup({
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "none",
        width = vim.o.columns,
        height = vim.o.lines - 2,
        row = 0,
        col = 0,
      },
    },
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
