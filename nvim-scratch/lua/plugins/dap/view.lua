require("dap-view").setup({
  winbar = {
    sections = { "scopes", "watches", "exceptions", "breakpoints", "threads", "repl" },
    default_section = "scopes",
  },
  keymaps = {
    hover = {
      quit = "q",
    },
  },
  windows = {
    position = "below",
  },
  hover = {
    border = "rounded",
  },
})

local icons = {
  Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}

vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

for name, sign in pairs(icons) do
  sign = type(sign) == "table" and sign or { sign }
  vim.fn.sign_define("Dap" .. name, {
    text = sign[1],
    texthl = sign[2] or "DiagnosticInfo",
    linehl = sign[3],
    numhl = sign[3],
  })
end
