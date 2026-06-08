return {
  {
    "leath-dub/snipe.nvim",
    branch = "main",
    config = function()
      require("snipe").setup({
        ui = { position = "center", open_win_override = { title = "Buffers", border = "rounded" }, buffer_format = { "icon", " ", "filename", " ", "directory" }, preselect_current = true },
        hints = { dictionary = "asflewcmpghio", prefix_key = "." },
        navigate = { leader = ",", close_buffer = "d" },
      })
      vim.keymap.set("n", "<leader>,", require("snipe").open_buffer_menu, { desc = "Buffers Menu" })
    end,
  },
}
