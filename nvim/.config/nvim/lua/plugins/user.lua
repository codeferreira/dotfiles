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
        default = { "lsp", "path", "snippets", "buffer", "windsurf" },
        providers = {
          windsurf = {
            name = "Windsurf",
            module = "codeium.blink",
            async = true,
            enabled = function()
              return not vim.tbl_contains({ "oil" }, vim.bo.filetype)
                and vim.bo.buftype ~= "prompt"
                and vim.b.completion ~= false
            end,
          },
        },
      },
    },
  },
}
