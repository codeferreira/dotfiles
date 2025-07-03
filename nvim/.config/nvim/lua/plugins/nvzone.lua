return {
  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },
  {
    "nvzone/timerly",
    cmd = "TimerlyToggle",
    keys = {
      {
        "<leader>uT",
        "<cmd> TimerlyToggle <CR>",
        desc = "Opens timerly",
      },
    },
  },
  { "nvzone/showkeys", cmd = "ShowkeysToggle" },
}
