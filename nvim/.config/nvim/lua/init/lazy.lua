local fn = vim.fn
local data_path = fn.stdpath("data")
local lazy_path = data_path .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
  vim.notify("Installing lazy.nvim...", vim.log.levels.INFO)
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim", lazy_path }
  vim.fn.system(clone_cmd)
end

vim.opt.rtp:prepend(lazy_path)

-- local modules = {
--   -- colors
--   "colors.tokyonight",
--   -- "colors.fleet",
--   -- "colors.adwaita",
--   -- "colors.kanagawa",
--   -- plugins
--   "plugins.treesitter",
--   "plugins.mini-icons",
--   "plugins.which-key",
--   "plugins.snacks",
--   "plugins.nvim-tree",
--   "plugins.kitty",
--   "plugins.persistence",
--   "plugins.conform",
--   "plugins.lsp",
--   "plugins.blink",
--   "plugins.lualine",
--   "plugins.telescope",
--   "plugins.flash",
--   "plugins.neogit",
--   "plugins.sidekick",
--   "plugins.snipe",
--   "plugins.markdown",
--   "plugins.terminal",
--   "plugins.dap",
--   "plugins.pairs",
--   "plugins.helm",
--   "plugins.oil",
-- }
--
-- local plugins = {}
-- for _, m in ipairs(modules) do
--   local ok, spec = pcall(require, m)
--   if ok and spec then
--     if type(spec) == "table" then
--       -- if module returns array of specs
--       if #spec > 0 then
--         for _, s in ipairs(spec) do
--           table.insert(plugins, s)
--         end
--       else
--         -- module returned a single spec table
--         table.insert(plugins, spec)
--       end
--     end
--   end
-- end

require("lazy").setup({ { import = "plugins" } })

return {}
