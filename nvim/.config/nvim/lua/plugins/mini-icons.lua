return {
  {
    "nvim-mini/mini.icons",
    version = "0.17.0",
    config = function()
      require("mini.icons").setup({})
      -- Provide devicons shim used elsewhere
      pcall(function() MiniIcons.mock_nvim_web_devicons() end)
    end,
  },
}
