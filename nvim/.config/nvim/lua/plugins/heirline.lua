return {
  "rebelot/heirline.nvim",
  dependencies = { "AstroNvim/astroui" },
  opts = function(_, opts)
    -- Disable tabline
    opts.tabline = nil

    -- Enable winbar with nice formatting
    local status = require "astroui.status"

    opts.statusline[1] = status.component.mode { mode_text = { padding = { left = 1, right = 1 } } } -- add the mode text

    opts.winbar = {
      -- Show file info in the winbar
      status.component.file_info {
        -- Show the file path relative to cwd
        filename = { modify = ":." },
        -- Show file modified status
        file_modified = { padding = { left = 1 } },
        -- Show file icon
        file_icon = { padding = { left = 1 }, default = false },
        filetype = false,
        -- Add some padding
        padding = { right = 1 },
        -- Update on these events
        update = { "BufEnter", "BufModifiedSet" },
      },
    }
    return opts
  end,
}
