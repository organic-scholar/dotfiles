-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--

-- vim.api.nvim_create_autocmd("VimEnter", {
--     nested = true,
--     callback = function()
--         require("persistence").load()
--     end,
-- })

vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  callback = function(args)
    local buf = args.buf or vim.api.nvim_get_current_buf()

    if vim.bo[buf].buftype ~= "" then
      return
    end

    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" then
      return
    end

    if not vim.bo[buf].modifiable or vim.bo[buf].readonly then
      return
    end
    if not vim.bo[buf].modified then
      return
    end

    if vim.bo[buf].filetype == "minifiles" then
      return
    end
    if name:match("^minifiles://") then
      return
    end

    if not LazyVim.format.enabled(buf) then
      return
    end

    -- format, then save in the callback (guaranteed order)
    require("conform").format({ bufnr = buf, lsp_fallback = true }, function()
      if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modified then
        vim.cmd("write")
      end
    end)
  end,
})
