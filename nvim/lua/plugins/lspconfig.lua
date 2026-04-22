return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tofu_ls = {
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(".opentofu")(fname)
        end,
      },
    },
  },
}
