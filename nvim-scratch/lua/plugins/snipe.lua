local add = MiniDeps.add

add({
  source = "leath-dub/snipe.nvim",
  checkout = "main",
})

require("snipe").setup({
  ui = {
    position = "center",
    open_win_override = {
      title = "Buffers",
      border = "rounded",
    },
    buffer_format = {
      "icon", -- file icon
      " ",
      "filename", -- file name
      " ",
      "directory", -- parent directory
    },
    preselect_current = true,
  },
  hints = {
    dictionary = "asflewcmpghio",
    prefix_key = ".",
  },
  navigate = {
    leader = ",",
    close_buffer = "d",
  },
})
--
vim.keymap.set("n", "<leader>,", require("snipe").open_buffer_menu, { desc = "Buffers Menu" })
