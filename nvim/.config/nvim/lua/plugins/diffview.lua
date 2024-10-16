return {
  "sindrets/diffview.nvim",
  event = "User AstroGitFile",
  cmd = { "DiffviewOpen" },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { winbar_info = true },
      file_history = { winbar_info = true },
    },
    hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
  },
  keys = {
    {
      "<leader>gvo",
      "<cmd> DiffviewOpen <CR>",
      desc = "Opens diff view",
    },
    {
      "<leader>gvc",
      "<cmd> DiffviewClose <CR>",
      desc = "Closes diff view",
    },
  },
  specs = {
    {
      "NeogitOrg/neogit",
      optional = true,
      opts = { integrations = { diffview = true } },
    },
  },
}
