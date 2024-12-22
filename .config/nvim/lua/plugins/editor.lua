return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem" },
      filesystem = {

        filtered_items = {
          visible = true, -- Show hidden files
          hide_dotfiles = false, -- Do not hide dotfiles
          hide_gitignored = false, -- Optional: Show Git-ignored files
        },
      },
      window = {
        width = 35,
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          last_indent_marker = "╰",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = " ",
          folder_open = " ",
          folder_empty = " ",
          folder_empty_open = " ",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "✚", -- NOTE: you can set any of these to an empty string to not show them
            deleted = "✖",
            modified = "",
            renamed = "󰁕",
            -- Status type
            untracked = "?",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },
  {

    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#c0c8d8" })
      vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#232934" })
    end,
  },
}
