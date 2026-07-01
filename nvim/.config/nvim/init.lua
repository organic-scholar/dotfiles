-- Override NvimLight* highlight groups after colorscheme loads
-- Tuned for #14161b background; HSL comfort zones applied

require("config.options")
require("config.filetype")
require("config.keymap")
require("config.autocmds")

require("myplugin")
require("init.lazy")

--
-- -- Load core plugin modules that may expose immediate config (they return specs consumed by lazy)
-- -- Plugin specs will be collected by init.lazy
-- require("plugins.treesitter")
-- require("plugins.mini-icons")
-- require("plugins.which-key")
-- -- require("plugins.snacks")
-- require("plugins.nvim-tree")
-- -- require("plugins.oil")
-- require("plugins.kitty")
-- require("plugins.persistence")
--
-- -- Deferred plugin modules are loaded/configured by lazy.nvim after installation
-- require("plugins.conform")
-- require("plugins.lsp")
-- require("plugins.blink")
-- require("plugins.lualine")
-- require("plugins.telescope")
-- require("plugins.flash")
-- require("plugins.neogit")
-- require("plugins.sidekick")
-- require("plugins.snipe")
-- require("plugins.markdown")
-- require("plugins.terminal")
-- require("plugins.dap")
-- require("plugins.pairs")

-- require("plugins.lazydev" )
