local add = MiniDeps.add

add({
  source = "MeanderingProgrammer/render-markdown.nvim",
  checkout = "v8.12.0",
})

add({
  source = "iamcco/markdown-preview.nvim",
  checkout = "v0.0.10",
  hooks = {
    post_checkout = function(path)
      local app_dir = path .. "/app"
      local res = vim.system({ "npm", "install" }, { cwd = app_dir }):wait()
      if res.code ~= 0 then
        vim.notify((res.stderr or "unknown error"), vim.log.levels.ERROR)
      end
    end,
  },
})

require("render-markdown").setup({
  code = {
    sign = true,
    width = "block",
    right_pad = 1,
  },
  heading = {
    sign = true,
  },
  checkbox = {
    enabled = false,
  },
})

vim.g.mkdp_filetypes = { "markdown" }

vim.keymap.set("n", "<leader>mp", function()
  vim.cmd.MarkdownPreview()
end, { desc = "Markdown preview" })
