local M = {}
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local make_entry = require("telescope.make_entry")
local entry_display = require("telescope.pickers.entry_display")

local home_row = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }

local default_maker = make_entry.gen_from_buffer({})

M.buffer_entry_maker = function(entry)
  local e = default_maker(entry) -- preserve ALL required fields

  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 2 },
      { remaining = true },
    },
  })

  local idx = entry.index or 1
  local letter = home_row[idx] or tostring(idx)

  e.display = function()
    return displayer({
      letter,
      e.ordinal, -- or e.filename
    })
  end

  return e
end

M.attach_home_row_mappings = function(prompt_bufnr, map)
  local function select_n(i)
    return function()
      local picker = action_state.get_current_picker(prompt_bufnr)
      local entry = picker.manager:get_entry(i)
      if entry then
        actions.close(prompt_bufnr)
        vim.cmd("buffer " .. entry.bufnr)
      end
    end
  end

  for i, key in ipairs(home_row) do
    map("i", key, select_n(i))
    map("n", key, select_n(i))
  end

  return true
end

return M
