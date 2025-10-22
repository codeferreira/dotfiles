-- Place this in ~/.config/nvim/lua/plugins/oil.lua
return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  init = function()
    -- Open oil instead of netrw when opening a directory
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            -- Replace neo-tree mappings with oil
            ["<Leader>e"] = {
              function()
                if vim.bo.filetype == "oil" then
                  require("oil").close()
                else
                  require("oil").open()
                end
              end,
              desc = "Toggle Oil file explorer",
            },
            ["<Leader>E"] = { function() require("oil").open(vim.fn.getcwd()) end, desc = "Open Oil in cwd" },
            ["<Leader>o"] = false, -- Disable the old neo-tree mapping if it exists
          },
        },
        autocmds = {
          oil_settings = {
            {
              event = "FileType",
              desc = "Disable view saving for oil buffers",
              pattern = "oil",
              callback = function(args) vim.b[args.buf].view_activated = false end,
            },
            {
              event = "User",
              pattern = "OilActionsPost",
              desc = "Close buffers when files are deleted in Oil",
              callback = function(args)
                if args.data.err then return end
                for _, action in ipairs(args.data.actions) do
                  if action.type == "delete" then
                    local _, path = require("oil.util").parse_url(action.url)
                    local bufnr = vim.fn.bufnr(path)
                    if bufnr ~= -1 then require("astrocore.buffer").wipe(bufnr, true) end
                  end
                end
              end,
            },
            -- Open oil when vim starts with a directory
            {
              event = "VimEnter",
              callback = function(data)
                -- buffer is a directory
                local directory = vim.fn.isdirectory(data.file) == 1
                if directory then
                  -- open oil
                  require("oil").open(data.file)
                end
              end,
            },
          },
        },
      },
    },
    {
      "rebelot/heirline.nvim",
      optional = true,
      dependencies = { "AstroNvim/astroui", opts = { status = { winbar = { enabled = { filetype = { "^oil$" } } } } } },
      opts = function(_, opts)
        if opts.winbar then
          local status = require "astroui.status"
          table.insert(opts.winbar, 1, {
            condition = function(self) return status.condition.buffer_matches({ filetype = "^oil$" }, self.bufnr) end,
            status.component.separated_path {
              padding = { left = 2 },
              max_depth = 0,
              suffix = false,
              path_func = function(self) return require("oil").get_current_dir(self.bufnr) end,
            },
          })
        end
      end,
    },
  },
  opts = function()
    local get_icon = require("astroui").get_icon
    return {
      columns = { { "icon", default_file = get_icon "DefaultFile", directory = get_icon "FolderClosed" } },
      -- Show dotfiles and git ignored files
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr) return false end,
        is_always_hidden = function(name, bufnr) return false end,
      },
      win_options = {
        signcolumn = "yes:2",
      },
      -- Better oil defaults
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      -- Keymaps in oil buffer
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
    }
  end,
}
