return {
  {
    "mason-org/mason-lspconfig.nvim",
    branch = "v2.2.0",
    dependencies = {
      { "mason-org/mason.nvim", branch = "v2.2.1" },
      { "neovim/nvim-lspconfig", branch = "v2.8.0" },
    },
    config = function()
      pcall(require("mason").setup)

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
          "jsonls",
          "pyrefly",
          "ts_ls",
        },
      })

      -- plugin-specific configs
      pcall(function() require("plugins.lsp.gopls") end)

      vim.lsp.config("tofu_ls", {
        root_dir = function(bufnr, on_dir)
          local root = vim.fs.root(bufnr, { ".opentofu" })
          if root then on_dir(root) end
        end,
      })

      vim.lsp.config("terraformls", {
        root_dir = function(bufnr, on_dir)
          if vim.fs.root(bufnr, { ".opentofu" }) then return end
          local root = vim.fs.root(bufnr, { ".terraform-version", ".terraform.lock.hcl" })
          if root then on_dir(root) end
        end,
        init_options = {
          indexing = { ignoreDirectoryNames = { "node_modules", ".git", "build" } },
          experimentalFeatures = { validateOnSave = true, prefillRequiredFields = true },
        },
      })

      vim.lsp.config("yamlls", {
        on_attach = function(client, bufnr)
          if vim.bo[bufnr].filetype == "helm" then pcall(function() vim.lsp.Client:stop(client.id) end) end
        end,
        filetypes = { "yaml", "yaml.docker-compose" },
        settings = { yaml = { format = { enable = true, proseWrap = "preserve", printWidth = 120 } } },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "terraformls" then client.server_capabilities.semanticTokensProvider = nil end
        end,
      })

      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 4 },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
      })

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
      vim.keymap.set("n", "mc", "<cmd>Mason<CR>", { desc = "Mason" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    end,
  },
}
