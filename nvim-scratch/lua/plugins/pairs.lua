local add = MiniDeps.add

add({ source = "nvim-mini/mini.pairs", checkout = "main" })

require("mini.pairs").setup()
