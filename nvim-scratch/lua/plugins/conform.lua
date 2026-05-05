local add = MiniDeps.add

add({
  source = "https://github.com/stevearc/conform.nvim",
  checkout = "v9.1.0",
})

require("conform").setup({
  formatters_by_ft = {
    ["*"] = { "trim_whitespace" },
    lua = { "stylua" },
  },

  format_on_save = function(bufnr)
    -- vim.notify("format_on_save for buf " .. bufnr)
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
})
