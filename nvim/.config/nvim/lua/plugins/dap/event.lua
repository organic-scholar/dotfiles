local dap = require("dap")

dap.listeners.after.event_initialized["dap_view"] = function()
  require("dap-view").open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  --require("dap-view").close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  --require("dap-view").close()
end

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dap.repl.open({}, "vsplit") -- vertical split
-- end
-- dap.listeners.after.event_initialized["open_repl"] = function()
--   local wins = vim.api.nvim_list_wins()
--   local current_win = vim.api.nvim_get_current_win()
--   local target_win
--
--   if #wins == 1 then
--     -- Only one window: create a vertical split, target the new (2nd) window
--     vim.cmd("vsplit")
--     target_win = vim.api.nvim_get_current_win()
--   else
--     -- Multiple windows: pick the 2nd one in the list
--     target_win = wins[2]
--   end
--
--   vim.api.nvim_set_current_win(target_win)
--   dap.repl.open({}, "enew")
--   vim.api.nvim_set_current_win(current_win) -- restore focus to original window
-- end
--
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dap.repl.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dap.repl.close()
-- end
--
