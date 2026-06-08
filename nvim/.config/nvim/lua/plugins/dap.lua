return {
  { "mfussenegger/nvim-dap", branch = "master" },
  { "leoluz/nvim-dap-go", branch = "main", config = function() require("plugins.dap.go") end },
  { "igorlfs/nvim-dap-view", branch = "main", config = function() require("plugins.dap.view") end },
  -- load keymaps and event handlers after dap is available
  {
    "mfussenegger/nvim-dap",
    init = function() pcall(function() require("plugins.dap.keymap") end) end,
  },
}
