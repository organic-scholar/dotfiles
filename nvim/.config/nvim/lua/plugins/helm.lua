return {
  {
    "qvalentin/helm-ls.nvim",
    branch = "main",
    lazy = false,
    opts = {
      conceal_templates = {
        -- enable the replacement of templates with virtual text of their current values
        enabled = false, -- tree-sitter must be setup for this feature
      },
      indent_hints = {
        -- enable hints for indent and nindent functions
        enabled = false, -- tree-sitter must be setup for this feature
      },
    },
    -- config = function() require("helm-ls").setup({}) end,
  },
}
