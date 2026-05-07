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

function M.notify(msg, kind)
	vim.notify(msg, kind, { title = "helm.nvim" })
end

--@private
--@param path string
--@return boolean
function M.is_helm_file(path)
	local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
	return not vim.tbl_isempty(check)
end

--@private
--@return string
function M.yaml_filetype(path, bufname)
	return M.is_helm_file(path) and "helm" or "yaml"
end

--@private
--@return string
function M.tmpl_filetype(path, bufname)
	return M.is_helm_file(path) and "helm" or "template"
end

--@private
--@return string
function M.tpl_filetype(path, bufname)
	return M.is_helm_file(path) and "helm" or "smarty"
end

return M
