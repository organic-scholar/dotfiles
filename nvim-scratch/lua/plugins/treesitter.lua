local add = MiniDeps.add
local utils = require("utils")

add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "main",
  monitor = "main",
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

local parsers = { "helm", "terraform", "go" }

require("nvim-treesitter").install(parsers)

vim.filetype.add({
  pattern = {
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- require('nvim-treesitter').setup({
--   ensure_installed = {
--     'helm'
--   },
-- })
--
--
