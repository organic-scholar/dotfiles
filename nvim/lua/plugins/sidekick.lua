return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      tools = {
        copilot = {
          keys = {
            -- submit = {
            --   "<c-s>",
            --   function()
            --     local key = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
            --     vim.api.nvim_feedkeys(key, "t", false)
            --   end,
            -- },
          },
        },
      },
    },
  },
}
