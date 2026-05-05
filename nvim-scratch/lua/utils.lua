local M = {}

--- Map a single LazyVim-style key entry to vim.keymap.set
--- @param keymap table Single LazyVim-style keymap entry
--- @param default_opts table? Optional default opts to merge
function M.map_key(keymap, default_opts)
  local lhs = keymap[1]
  local rhs = keymap[2]

  local modes = keymap.mode or { "n" }
  if type(modes) == "string" then
    modes = { modes }
  end

  local opts = vim.tbl_extend("force", default_opts or {}, {
    desc = keymap.desc,
    expr = keymap.expr,
    silent = keymap.silent,
    noremap = keymap.noremap,
    nowait = keymap.nowait,
    buffer = keymap.buffer,
    ft = keymap.ft,
  })

  for k, v in pairs(opts) do
    if v == nil then
      opts[k] = nil
    end
  end

  vim.keymap.set(modes, lhs, rhs, opts)
end

--- Map a list of LazyVim-style key entries to vim.keymap.set
--- @param keys table LazyVim-style keys table
--- @param default_opts table? Optional default opts to merge
function M.map_keys(keys, default_opts)
  for _, keymap in ipairs(keys) do
    M.map_key(keymap, default_opts)
  end
end

return M
