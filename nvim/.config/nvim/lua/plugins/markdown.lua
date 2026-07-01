return {
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   branch = "v8.12.0",
  --   config = function()
  --     require("render-markdown").setup({
  --       code = { sign = true, width = "block", right_pad = 1, conceal_delimiters = false },
  --       heading = { sign = true },
  --       checkbox = { enabled = false },
  --     })
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    tag = "v0.0.10",
    build = "cd app && yarn install",
    -- build = function() vim.fn["mkdp#util#install"]() end,
    -- build = function(plugin)
    --   local app_dir = plugin.dir .. "/app"
    --   local res = vim.system({ "npm", "install" }, { cwd = app_dir }):wait()
    --   if res.code ~= 0 then vim.notify((res.stderr or "unknown error"), vim.log.levels.ERROR) end
    -- end,
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keymap.set("n", "<leader>mp", function() vim.cmd.MarkdownPreview() end, { desc = "Markdown preview" })
    end,
  },
}
