return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- run TSUpdate after installing/updating
    build = function()
      pcall(vim.cmd, "TSUpdate")
    end,
    config = function()
      local parsers = { "helm", "terraform", "go" }
      pcall(require("nvim-treesitter.install").ensure_installed, parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
