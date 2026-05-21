local add = MiniDeps.add

add({
  source = "mason-org/mason-lspconfig.nvim",
  checkout = "v2.2.0",
  depends = {
    {
      source = "mason-org/mason.nvim",
      checkout = "v2.2.1",
    },
    {
      source = "neovim/nvim-lspconfig",
      checkout = "v2.8.0",
    },
  },
})

require("mason").setup()

require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = {
    "lua_ls",
    "copilot",
    "helm_ls",
    "tofu_ls",
    "terraformls",
    "yamlls",
    "gopls",
  },
})

require("plugins.lsp.gopls")

vim.lsp.config("tofu_ls", {
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { ".opentofu" })
    if root then
      on_dir(root)
    end
  end,
})

vim.lsp.config("terraformls", {
  root_dir = function(bufnr, on_dir)
    -- If a .opentofu file exists in the project root, don't start terraformls
    if vim.fs.root(bufnr, { ".opentofu" }) then
      return
    end
    -- Fallbacks: look for terraform indicators
    local root = vim.fs.root(bufnr, { ".terraform-version", ".terraform.lock.hcl" })
    if root then
      on_dir(root)
    end
  end,
})

vim.lsp.config("yamlls", {
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "helm" then
      vim.lsp.Client:stop(client.id)
    end
  end,
  filetypes = { "yaml", "yaml.docker-compose" }, -- exclude "helm"
  settings = {
    yaml = {
      format = {
        enable = true,
        proseWrap = "preserve",
        printWidth = 120,
      },
    },
  },
})

-- Disable semantic tokens for terraformls: terraform-ls returns invalid
-- token lengths causing an infinite loop in str_utfindex on neovim nightly.
-- https://github.com/neovim/neovim/issues/36257
-- https://github.com/hashicorp/terraform-ls/issues/2094
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "terraformls" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

-- vim.lsp.inline_completion.enable()

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
vim.keymap.set("n", "mc", "<cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
