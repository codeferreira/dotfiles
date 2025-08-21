---@type LazySpec
return {
  "laytan/cloak.nvim",
  opts = {},
  keys = {
    {
      "<leader>uk",
      "<cmd> CloakToggle <CR>",
      desc = "Opens diff view",
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "CloakDisable", "CloakEnable", "CloakToggle" },
}
