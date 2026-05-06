local add = MiniDeps.add

add({
  source = "https://github.com/neovim/nvim-lspconfig",
  checkout = "v2.8.0",
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("copilot")
-- vim.lsp.enable("tofu_ls")
-- vim.lsp.config("tofu_ls", {
--   root_dir = function(fname)
--     return require("lspconfig.util").root_pattern(".opentofu")(fname)
--   end,
-- })
vim.lsp.enable("terraformls")
vim.lsp.enable("yamlls")
vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      format = {
        enable = true,
        proseWrap = "preserve",
        printWidth = 120
      }
    },
  },
})


-- Disable semantic tokens for terraformls: terraform-ls returns invalid
-- token lengths causing an infinite loop in str_utfindex on neovim nightly.
-- https://github.com/neovim/neovim/issues/36257
-- https://github.com/hashicorp/terraform-ls/issues/2094
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "terraformls" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.lsp.inline_completion.enable()
vim.diagnostic.config({
  -- show inline virtual text next to the line
  virtual_text = {
    prefix = "●", -- or "■", "▎", "»", "✘"
    spacing = 4,
  },

  -- show signs in the gutter (the left column)
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },

  underline = true, -- underline the offending code
  update_in_insert = false, -- don't spam diagnostics while typing
  severity_sort = true, -- errors before warnings
  float = {
    border = "rounded",
    source = true, -- show which LSP reported it
  },
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
