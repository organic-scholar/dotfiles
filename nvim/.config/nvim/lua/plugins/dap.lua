local add = MiniDeps.add

add({
  source = "https://codeberg.org/mfussenegger/nvim-dap.git",
  checkout = "master",
})

add({
  source = "https://github.com/leoluz/nvim-dap-go.git",
  checkout = "main",
})

add({
  source = "https://github.com/igorlfs/nvim-dap-view.git",
  checkout = "main",
})

require("plugins.dap.keymap")
require("plugins.dap.view")
require("plugins.dap.event")

require("plugins.dap.go")
