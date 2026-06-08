return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "v0.2.2",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", branch = "main", build = function(path) vim.system({ "make" }, { cwd = path }) end },
      { "nvim-telescope/telescope-frecency.nvim", branch = "1.2.2" },
    },
    config = function()
      require("telescope").setup({
        pickers = { buffers = {} },
        extensions = {
          fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
          frecency = { workspace = "CWD", show_scores = true, show_unindexed = true },
        },
      })

      pcall(function() require("telescope").load_extension("fzf") end)
      pcall(function() require("telescope").load_extension("frecency") end)

      local function live_grep_min_chars(opts)
        opts = opts or {}
        opts.debounce = opts.debounce or 200
        require("telescope.builtin").live_grep(opts)
      end

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", function() live_grep_min_chars({ debounce = 300 }) end, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fr", function()
        require("telescope").extensions.frecency.frecency({ theme = "ivy" })
      end, { desc = "Telescope frecency" })
    end,
  },
}
