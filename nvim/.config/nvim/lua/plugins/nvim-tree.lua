return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "1.17.0",
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    opts = {
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
      renderer = {
        symlink_destination = false,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts("CD"))
        -- Free up f and F for flash.nvim
        vim.keymap.del("n", "f", { buffer = bufnr })
        vim.keymap.del("n", "F", { buffer = bufnr })
      end,
    },
  },
}
