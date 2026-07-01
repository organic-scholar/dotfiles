local M = {}

M.state = {
  job_id = nil,
  cmd_buf = nil,
  out_buf = nil,
}

local function ensure_command_buffer()
  if M.state.cmd_buf and vim.api.nvim_buf_is_valid(M.state.cmd_buf) then return M.state.cmd_buf end

  local buf = vim.api.nvim_create_buf(false, false)
  vim.bo[buf].filetype = "sh"
  vim.bo[buf].bufhidden = "hide"
  vim.api.nvim_buf_set_name(buf, "Shellpad Commands")

  M.state.cmd_buf = buf
  return buf
end

local function ensure_output_buffer()
  if M.state.out_buf and vim.api.nvim_buf_is_valid(M.state.out_buf) then return end

  M.state.out_buf = vim.api.nvim_create_buf(false, true)
  vim.bo[M.state.out_buf].bufhidden = "hide"
  vim.bo[M.state.out_buf].swapfile = false

  vim.api.nvim_buf_set_name(M.state.out_buf, "Shellpad Output")

  M.state.term_chan = vim.api.nvim_open_term(M.state.out_buf, {
    on_input = function() end,
  })
  return M.state.out_buf
end
-- local function ensure_output_buffer()
--   if M.state.out_buf and vim.api.nvim_buf_is_valid(M.state.out_buf) then return M.state.out_buf end
--
--   local buf = vim.api.nvim_create_buf(false, true)
--   vim.bo[buf].buftype = "nofile"
--   vim.bo[buf].bufhidden = "hide"
--   vim.bo[buf].swapfile = false
--   vim.bo[buf].filetype = "sh"
--   vim.api.nvim_buf_set_name(buf, "Shellpad Output")
--
--   M.state.out_buf = buf
--   return buf
-- end

-- local function append(lines)
--   if not M.state.out_buf or not vim.api.nvim_buf_is_valid(M.state.out_buf) then return end
--
--   lines = vim.tbl_filter(function(line) return line ~= nil and line ~= "" end, lines)
--
--   if #lines == 0 then return end
--
--   vim.schedule(function() vim.api.nvim_buf_set_lines(M.state.out_buf, -1, -1, false, lines) end)
-- end

local function write_output(text)
  ensure_output_buffer()

  if not text or text == "" then return end

  vim.schedule(function()
    if M.state.term_chan then vim.api.nvim_chan_send(M.state.term_chan, text) end
  end)
end

function M.start_shell()
  if M.state.job_id then return end

  M.state.job_id = vim.fn.jobstart({ "bash" }, {
    pty = true,
    stdout_buffered = false,
    stderr_buffered = false,
    on_stdout = function(_, data)
      if data and #data > 0 then write_output(table.concat(data, "\n")) end
    end,

    on_stderr = function(_, data)
      if data and #data > 0 then write_output(table.concat(data, "\n")) end
    end,

    on_exit = function(_, code)
      -- append({ "", "[shell exited with code " .. code .. "]" })
      M.state.job_id = nil
    end,
  })
end

function M.open_command_buffer()
  local buf = ensure_command_buffer()
  vim.api.nvim_win_set_buf(0, buf)
end

function M.open_output_buffer()
  local buf = ensure_output_buffer()
  vim.api.nvim_win_set_buf(0, buf)
end

function M.run_line()
  M.start_shell()

  local line = vim.api.nvim_get_current_line()
  if line == "" then return end

  vim.fn.chansend(M.state.job_id, line .. "\n")
end

vim.keymap.set("n", "<leader>tc", function()
  vim.cmd("split")
  M.open_command_buffer()
end)

vim.keymap.set("n", "<leader>to", function()
  vim.cmd("vsplit")
  M.open_output_buffer()
end)

vim.keymap.set("n", "<leader>tr", M.run_line, { desc = "Run current shell line" })

return M
