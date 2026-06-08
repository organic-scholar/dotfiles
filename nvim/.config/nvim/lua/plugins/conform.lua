return {
  {
    "stevearc/conform.nvim",
    branch = "v9.1.0",
    lazy = false,
    config = function()





      require("conform").setup({
        formatters_by_ft = { lua = { "stylua" } },
        format_on_save = function(bufnr) return { timeout_ms = 500, lsp_format = "fallback" } end,
      })
    end,
  },
}
