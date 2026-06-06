local add = MiniDeps.add

add({
  source = "https://github.com/nvim-mini/mini.icons",
  checkout = "0.17.0",
})

require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons() -- This is the key call
