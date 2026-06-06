require("dap-go").setup({
  dap_configurations = {},
})

require("dap").configurations.go = {}

-- require("dap").configurations.go = {
--   {
--     name = "Debug Main",
--     type = "go",
--     request = "launch",
--     mode = "debug",
--     program = "${workspaceFolder}",
--     cwd = "${workspaceFolder}",
--     args = {},
--     showLog = true,
--     dlvFlags = {},
--     outputMode = "remote",
--   },
-- }
