local dap = require("dap")

vim.keymap.set("n", "<leader>b", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug toggle breakpoint" })

vim.keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Debug continue" })

vim.keymap.set("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Debug run last" })

local function set_dap_keymap()
  vim.keymap.set("n", "h", function()
    require("dap-view").hover()
  end, { desc = "DAP hover" })

  vim.keymap.set("n", "c", function()
    require("dap").continue()
  end, { desc = "Debug continue" })

  vim.keymap.set("n", "o", function()
    require("dap").step_over()
  end, { desc = "Debug step over" })

  vim.keymap.set("n", "i", function()
    require("dap").step_into()
  end, { desc = "Debug step into" })

  vim.keymap.set("n", "O", function()
    require("dap").step_out()
  end, { desc = "Debug step out" })

  vim.keymap.set("n", "b", function()
    require("dap").toggle_breakpoint()
  end, { desc = "Debug toggle breakpoint", noremap = true })

  vim.keymap.set("n", "B", function()
    require("dap").set_breakpoint()
  end, { desc = "Debug set breakpoint" })

  vim.keymap.set("n", "lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end, { desc = "Debug set log point" })
end

local function del_dap_keymap()
  pcall(vim.keymap.del, "n", "h")
  pcall(vim.keymap.del, "n", "c")
  pcall(vim.keymap.del, "n", "O")
  pcall(vim.keymap.del, "n", "i")
  pcall(vim.keymap.del, "n", "b")
  pcall(vim.keymap.del, "n", "B")
  pcall(vim.keymap.del, "n", "lp")
end

-- vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
--   require("dap.ui.widgets").hover()
-- end, { desc = "Debug hover" })

vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "Debug preview" })

vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "Debug frames" })

vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "Debug scopes" })

dap.listeners.after.event_initialized["dap_keymap"] = function()
  set_dap_keymap()
end

dap.listeners.before.event_terminated["dap_keymap"] = function()
  del_dap_keymap()
  --require("dap-view").close()
end

dap.listeners.before.event_exited["dap_keymap"] = function()
  del_dap_keymap()
  --require("dap-view").close()
end
