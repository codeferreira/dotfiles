return {
  "mistricky/codesnap.nvim",
  keys = {
    { "<leader>upc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>ups", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    border = "rounded",
    has_breadcrumbs = true,
    has_line_number = true,
    bg_x_padding = 12,
    bg_y_padding = 12,
    bg_theme = "grape",
    watermark = "",
    save_path = "~/Pictures",
  },
}
