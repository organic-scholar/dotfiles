---@type integer?
local term_buf = nil
---@type integer?
local term_win = nil

local function toggle_float_term()
  -- if window is open, hide it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, false)
    term_win = nil
    return
  end

  -- reuse existing buffer or create a new one
  if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
    term_buf = vim.api.nvim_create_buf(false, true)

    -- set q keymap only once when buffer is first created
    vim.keymap.set("n", "q", function()
      if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_win_close(term_win, false)
        term_win = nil
      end
    end, { buffer = term_buf, silent = true })
  end

  term_win = vim.api.nvim_open_win(term_buf, true, {
    relative = "editor",
    border = "none",
    width = vim.o.columns,
    height = vim.o.lines - 2,
    row = 0,
    col = 0,
  })

  if vim.bo[term_buf].buftype ~= "terminal" then
    vim.fn.jobstart(vim.o.shell, {
      term = true,
    })
  end
  vim.api.nvim_set_current_win(term_win)
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", toggle_float_term, { noremap = true, silent = true })
