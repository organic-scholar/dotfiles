return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["o"] = "confirm", -- open file to edit (same as <CR>)
                  ["O"] = "explorer_open", -- keep system-open on a different key (optional)
                  ["<Esc>"] = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
