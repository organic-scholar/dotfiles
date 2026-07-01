return {
  {
    "stevearc/conform.nvim",
    tag = "v9.1.0",
    lazy = false,
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          markdown = { "prettier" },
          python = { "black" },
        },
        format_on_save = function(bufnr) return { timeout_ms = 5000, lsp_format = "fallback" } end,
      })
    end,
  },
}
