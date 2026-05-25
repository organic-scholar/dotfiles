local add = MiniDeps.add

add({
  source = "https://github.com/nvim-tree/nvim-tree.lua",
  checkout = "v1.17.0",
})

require("nvim-tree").setup({
  view = {
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "none",
        -- width = vim.o.columns,
        height = vim.o.lines - 2,
        row = 0,
        col = 0,
      },
    },
  },
  filters = {
    git_ignored = false,
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts("CD"))
  end,
})

-- BEGIN_ON_ATTACH_DEFAULT

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
