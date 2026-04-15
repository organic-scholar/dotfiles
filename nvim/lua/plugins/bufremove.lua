return {
  "nvim-mini/mini.bufremove",
  keys = {
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Buffer Delete",
    },
  },
}
