local add = MiniDeps.add
add({
  source = "nvim-telescope/telescope.nvim",
  checkout = "v0.2.2",
  depends = {
    { source = "nvim-lua/plenary.nvim" },
    {
      source = "nvim-telescope/telescope-fzf-native.nvim",
      checkout = "main",
      hooks = {
        post_checkout = function(path)
          vim.system({ "make" }, { cwd = path })
        end,
      },
    },
    {
      source = "nvim-telescope/telescope-frecency.nvim",
      checkout = "1.2.2",
    },
  },
})

require("telescope").setup({
  pickers = {
    buffers = {
      -- entry_maker = custom.buffer_entry_maker,
      -- attach_mappings = custom.attach_home_row_mappings,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")

local function live_grep_min_chars(opts)
  opts = opts or {}
  opts.debounce = opts.debounce or 200
  require("telescope.builtin").live_grep(opts)
end

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files()
end, { desc = "Telescope find files" })

vim.keymap.set("n", "<leader>fg", function()
  live_grep_min_chars({ debounce = 300 })
end, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
