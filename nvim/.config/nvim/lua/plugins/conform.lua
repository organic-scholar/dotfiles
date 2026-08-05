return {
  {
    "stevearc/conform.nvim",
    tag = "v9.1.0",
    lazy = false,
    config = function()
      require("conform").setup({
        log_level = vim.log.levels.DEBUG,
        formatters_by_ft = {
          lua = { "stylua" },
          markdown = { "prettier" },
          python = { "black" },
        },
        format_on_save = function(bufnr) return { timeout_ms = 5000, lsp_format = "fallback" } end,
        formatters = {
          -- Run prettier from the file's own git root, not an ancestor repo.
          -- Otherwise prettier inherits an ancestor .gitignore (e.g. a parent
          -- repo ignoring "sources/") and silently treats the file as ignored,
          -- so format-on-save appears to do nothing.
          prettier = {
            cwd = require("conform.util").root_file({ ".git" }),
          },
        },
      })
    end,
  },
}
