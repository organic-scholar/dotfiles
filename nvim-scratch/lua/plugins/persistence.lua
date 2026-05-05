local add = MiniDeps.add
local map = vim.keymap.set

add({
  source = "https://github.com/folke/persistence.nvim",
  checkout = "v3.1.0",
})

require("persistence").setup({
  -- directory where session files are saved
  dir = vim.fn.stdpath("state") .. "/sessions/",
  -- minimum number of file buffers that need to be open to save
  -- Set to 0 to always save
  need = 1,
  -- use git branch to save session
  branch = true,
})

-- load the session for the current directory
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore Session" })
-- select a session to load
map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select session" })
-- load the last session
map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })
-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Don't Save Current Session" })
