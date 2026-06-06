local add = MiniDeps.add

add({
  source = "qvalentin/helm-ls.nvim",
  checkout = "v1.10.2",
})

require("helm-ls").setup({})
