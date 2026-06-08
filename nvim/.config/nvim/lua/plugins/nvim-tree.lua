return {
  {
    "nvim-tree/nvim-tree.lua",
    branch = "v1.17.0",
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        git = {
          enable = false,
        },
        view = {
          width = {
            max = -1,
          },
        },
        filters = { git_ignored = false },
        actions = {
          open_file = { quit_on_open = true },
          change_dir = { restrict_above_cwd = true },
        },
        update_focused_file = {
          enable = true, -- highlight the currently opened file
          update_root = false, -- optionally change root to file's directory
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts("CD"))
        end,
      })

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
