return {
  {
    "knubie/vim-kitty-navigator",
    branch = "master",
    enabled = os.getenv("KITTY_PID") ~= nil,
  },
}
