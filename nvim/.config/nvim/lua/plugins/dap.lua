return {
  { "mfussenegger/nvim-dap", branch = "master" },
  { "leoluz/nvim-dap-go", branch = "main", config = function() require("plugins.dap.go") end },
  { "igorlfs/nvim-dap-view", branch = "main", config = function() require("plugins.dap.view") end },
  -- load keymaps and event handlers after dap is available
  {
    "mfussenegger/nvim-dap",
    init = function()
      pcall(function()
        local dap = require("dap")
        require("dap-view").setup({
          windows = {
            terminal = {
              -- Use the actual names for the adapters you want to hide
              hide = { "delve", "codelldb" }, -- `delve` is known to not use the terminal.
            },
          },
        })
        dap.adapters.lldb = {
          type = "executable",
          command = "/usr/bin/lldb-dap", -- adjust as needed, must be absolute path
          name = "lldb",
        }

        dap.adapters.codelldb = {
          type = "executable",
          command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
          -- On windows you may have to uncomment this:
          -- detached = false,
        }
        require("plugins.dap.keymap")
      end)
    end,
  },
}
