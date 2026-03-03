---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  {
    "akinsho/toggleterm.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  { "vague-theme/vague.nvim" },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "Exafunction/windsurf.nvim" },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "codeium" },
        providers = {
          codeium = { name = "Codeium", module = "codeium.blink", async = true },
        },
      },
    },
  },
}
