return {
  {
    "folke/sidekick.nvim",
    branch = "v2.3.0",
    config = function()
      local utils = require("utils")
      local map_keys = utils.map_keys

      require("sidekick").setup({ nes = { enabled = true } })

      local keys = {
        {
          "<Right>",
          function()
            if not require("sidekick").nes_jump_or_apply() then
              return "<Right>"
            end
          end,
          expr = true,
          desc = "goto/apply next edit suggestion",
        },
        {
          "<c-.>",
          function() require("sidekick.cli").focus() end,
          desc = "Sidekick Focus",
          mode = { "n", "t", "i", "x" },
        },
        { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Sidekick Toggle CLI" },
        { "<leader>as", function() require("sidekick.cli").select() end, desc = "Select CLI" },
        { "<leader>ad", function() require("sidekick.cli").close() end, desc = "Detach a CLI Session" },
        { "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, mode = { "x", "n" }, desc = "Send This" },
        { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File" },
        { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = { "x" }, desc = "Send Visual Selection" },
        { "<leader>ap", function() require("sidekick.cli").prompt() end, mode = { "n", "x" }, desc = "Sidekick Select Prompt" },
        { "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end, desc = "Sidekick Toggle Claude" },
      }

      map_keys(keys)
    end,
  },
}
