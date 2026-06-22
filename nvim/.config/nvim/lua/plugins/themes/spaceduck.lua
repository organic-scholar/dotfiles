return {
  {
    "pineapplegiant/spaceduck",
    branch = "main",
    config = function()
      -- require("spaceduck").setup({})
      vim.cmd.colorscheme("spaceduck")
    end,
  },
}
