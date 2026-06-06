local add = MiniDeps.add

add({
  source = "folke/snacks.nvim",
})

local Snacks = require("snacks")

Snacks.setup({
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  explorer = {
    enabled = true,
  },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  picker = {
    enabled = true,
    sources = {
      explorer = {
        hidden = true,
        ignored = true,
        auto_close = false,
        reuse_win = true,
        win = {
          list = {
            keys = {
              ["o"] = "confirm", -- open file to edit (same as <CR>)
              ["O"] = "explorer_open", -- keep system-open on a different key (optional)
              ["<Esc>"] = false,
            },
          },
        },
      },
    },
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  styles = {
    notification = {},
  },
})

-- Keymaps
local map = vim.keymap.set
-- Top Pickers & Explorer
map("n", "<leader><space>", Snacks.picker.smart, { desc = "Smart Find Files" })
map("n", "<leader>,", Snacks.picker.buffers, { desc = "Buffers" })
map("n", "<leader>/", Snacks.picker.grep, { desc = "Grep" })
map("n", "<leader>:", Snacks.picker.command_history, { desc = "Command History" })
map("n", "<leader>n", Snacks.picker.notifications, { desc = "Notification History" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File Explorer" })

-- Find
map("n", "<leader>fb", Snacks.picker.buffers, { desc = "Buffers" })
map("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
map("n", "<leader>ff", Snacks.picker.files, { desc = "Find Files" })
map("n", "<leader>fg", Snacks.picker.git_files, { desc = "Find Git Files" })
map("n", "<leader>fp", Snacks.picker.projects, { desc = "Projects" })
map("n", "<leader>fr", Snacks.picker.recent, { desc = "Recent" })

-- Git
map("n", "<leader>gb", Snacks.picker.git_branches, { desc = "Git Branches" })
map("n", "<leader>gl", Snacks.picker.git_log, { desc = "Git Log" })
map("n", "<leader>gL", Snacks.picker.git_log_line, { desc = "Git Log Line" })
map("n", "<leader>gs", Snacks.picker.git_status, { desc = "Git Status" })
map("n", "<leader>gS", Snacks.picker.git_stash, { desc = "Git Stash" })
map("n", "<leader>gd", Snacks.picker.git_diff, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", Snacks.picker.git_log_file, { desc = "Git Log File" })

-- GitHub
map("n", "<leader>gi", Snacks.picker.gh_issue, { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", function()
  Snacks.picker.gh_issue({ state = "all" })
end, { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", Snacks.picker.gh_pr, { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", function()
  Snacks.picker.gh_pr({ state = "all" })
end, { desc = "GitHub Pull Requests (all)" })

-- Grep
map("n", "<leader>sb", Snacks.picker.lines, { desc = "Buffer Lines" })
map("n", "<leader>sB", Snacks.picker.grep_buffers, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", Snacks.picker.grep, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", Snacks.picker.grep_word, { desc = "Visual selection or word" })

-- Search
map("n", '<leader>s"', Snacks.picker.registers, { desc = "Registers" })
map("n", "<leader>s/", Snacks.picker.search_history, { desc = "Search History" })
map("n", "<leader>sa", Snacks.picker.autocmds, { desc = "Autocmds" })
map("n", "<leader>sc", Snacks.picker.command_history, { desc = "Command History" })
map("n", "<leader>sC", Snacks.picker.commands, { desc = "Commands" })
map("n", "<leader>sd", Snacks.picker.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>sD", Snacks.picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })
map("n", "<leader>sh", Snacks.picker.help, { desc = "Help Pages" })
map("n", "<leader>sH", Snacks.picker.highlights, { desc = "Highlights" })
map("n", "<leader>si", Snacks.picker.icons, { desc = "Icons" })
map("n", "<leader>sj", Snacks.picker.jumps, { desc = "Jumps" })
map("n", "<leader>sk", Snacks.picker.keymaps, { desc = "Keymaps" })
map("n", "<leader>sl", Snacks.picker.loclist, { desc = "Location List" })
map("n", "<leader>sm", Snacks.picker.marks, { desc = "Marks" })
map("n", "<leader>sM", Snacks.picker.man, { desc = "Man Pages" })
map("n", "<leader>sp", Snacks.picker.lazy, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", Snacks.picker.qflist, { desc = "Quickfix List" })
map("n", "<leader>sR", Snacks.picker.resume, { desc = "Resume" })
map("n", "<leader>su", Snacks.picker.undo, { desc = "Undo History" })
map("n", "<leader>uC", Snacks.picker.colorschemes, { desc = "Colorschemes" })

-- LSP
map("n", "gd", Snacks.picker.lsp_definitions, { desc = "Goto Definition" })
map("n", "gD", Snacks.picker.lsp_declarations, { desc = "Goto Declaration" })
map("n", "gr", Snacks.picker.lsp_references, { desc = "References" })
map("n", "gI", Snacks.picker.lsp_implementations, { desc = "Goto Implementation" })
map("n", "gy", Snacks.picker.lsp_type_definitions, { desc = "Goto Type Definition" })

-- Other
--map("n", "<leader>z", Snacks.zen, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function()
  Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })
--map("n", "<leader>.", Snacks.scratch, { desc = "Toggle Scratch Buffer" })
-- map("n", "<leader>S", function()
--   Snacks.scratch.select()
-- end, { desc = "Select Scratch Buffer" })
-- map("n", "<leader>bd", Snacks.bufdelete, { desc = "Delete Buffer" })
-- map("n", "<leader>cR", function()
--   Snacks.rename.rename_file()
-- end, { desc = "Rename File" })
-- map({ "n", "v" }, "<leader>gB", Snacks.gitbrowse, { desc = "Git Browse" })
-- map("n", "<leader>gg", Snacks.lazygit, { desc = "Lazygit" })
-- map("n", "<leader>un", Snacks.notifier.hide, { desc = "Dismiss Notifications" })
-- map("n", "<c-/>", Snacks.terminal, { desc = "Toggle Terminal" })
-- map("n", "<c-_>", Snacks.terminal, { desc = "which_key_ignore" })
-- map({ "n", "t" }, "]]", function()
--   Snacks.words.jump(vim.v.count1)
-- end, { desc = "Next Reference" })
-- map({ "n", "t" }, "[[", function()
--   Snacks.words.jump(vim.v.count1)
-- end, { desc = "Prev Reference" })
