return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        -- Diffview mappings
        ["<leader>gD"] = { "<cmd>DiffviewOpen develop<cr>", desc = "Diffview Open (develop)" },
        ["<leader>gM"] = { "<cmd>DiffviewOpen main<cr>", desc = "Diffview Open (main)" },
        ["<leader>gB"] = {
          function()
            vim.ui.input({ prompt = "Branch to compare: " }, function(input)
              if input then
                if input ~= "" then
                  vim.cmd("DiffviewOpen " .. input)
                end
              else
                print("Cancelled")
              end
            end)
          end,
          desc = "Diffview Open (branch prompt)",
        },
      },
    },
  },
}
