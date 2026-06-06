local add = MiniDeps.add

add({
  source = "stevearc/oil.nvim",
  checkout = "v2.15.0",
})

require("oil").setup({
  win_options = {
    winbar = "%{fnamemodify(v:lua.require('oil').get_current_dir(), ':~')}",
    -- winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
  },
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
