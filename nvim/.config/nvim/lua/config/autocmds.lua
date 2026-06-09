-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "InsertLeave", "TextChanged" }, {

vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  nested = true,
  callback = function(args)
    local buf = args.buf or vim.api.nvim_get_current_buf()
    if vim.bo[buf].buftype ~= "" then return end
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" then return end
    local stat = vim.uv.fs_stat(name)
    if stat and stat.type == "directory" then return end
    if not vim.bo[buf].modifiable or vim.bo[buf].readonly then return end
    if not vim.bo[buf].modified then return end
    if vim.bo[buf].filetype == "minifiles" then return end
    if name:match("^minifiles://") then return end
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modified then vim.cmd("write") end
  end,
})

-- quit command line
vim.api.nvim_create_autocmd("CmdwinEnter", {
  callback = function()
    vim.keymap.set("n", "q", "<cmd>quit<CR>", {
      buffer = true,
      silent = true,
      desc = "Quit command-line window",
    })
    vim.keymap.set("n", "<esc>", "<cmd>quit<CR>", {
      buffer = true,
      silent = true,
      desc = "Quit command-line window",
    })
    vim.schedule(function() vim.cmd("startinsert") end)
  end,
})

local nontext = vim.api.nvim_get_hl(0, { name = "NonText" })

-- print(vim.inspect(string.format("#%06x", nontext.fg)))
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "default",
  callback = function()
    local replacements = {
      ["#a6dbff"] = "#89badc", -- Clear Pastel Blue (L: 0.74, C: 0.08, H: 245)
      ["#8cf8f7"] = "#83c6c3", -- Clear Soft Teal (L: 0.77, C: 0.07, H: 185)
      ["#b3f6c0"] = "#9bc5a2", -- Soft Mint (L: 0.77, C: 0.07, H: 145)
      ["#ffcaff"] = "#d1b0ce", -- Soft Orchid/Pink (L: 0.74, C: 0.06, H: 330)
      ["#ffc0b9"] = "#ce9c97", -- Muted Coral (L: 0.69, C: 0.08, H: 20)
      ["#fce094"] = "#caae84", -- Muted Gold (L: 0.73, C: 0.08, H: 85)
      ["#eef1f8"] = "#bec2cb", -- Main Text (L: 0.79, C: 0.015, H: 250) - Clean, stable contrast
      ["#e0e2ea"] = "#aab0b9", -- Secondary Text (L: 0.72, C: 0.015, H: 250)
      ["#c4c6cd"] = "#8e939c", -- Muted UI (L: 0.62, C: 0.012, H: 250)
      ["#9b9ea4"] = "#757981", -- Comments (L: 0.53, C: 0.010, H: 250)
    }

    local all = vim.api.nvim_get_hl(0, {})
    vim.api.nvim_set_hl(0, "NonText", { fg = replacements["#9b9ea4"] })

    for name, hl in pairs(all) do
      -- skip pure links, they inherit from their target
      if not hl.link then
        local changed = {}

        if hl.fg then
          local hex = string.format("#%06x", hl.fg)
          if replacements[hex] then changed.fg = replacements[hex] end
        end

        if hl.bg then
          local hex = string.format("#%06x", hl.bg)
          if replacements[hex] then changed.bg = replacements[hex] end
        end

        if next(changed) then
          -- merge with existing attrs so bold/italic/etc are preserved
          local new_hl = vim.tbl_extend("force", hl, changed)
          vim.api.nvim_set_hl(0, name, new_hl)
        end
      end
    end
  end,
})
