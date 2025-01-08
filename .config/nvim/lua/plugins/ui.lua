return {
  {

    "nvim-lualine/lualine.nvim",
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus
      local function fmt_mode(s)
        local mode_map = {
          ["COMMAND"] = "COMMND",
          ["V-BLOCK"] = "VBLOCK",
          ["TERMINAL"] = "TERMNL",
          ["V-REPLACE"] = "VREPLC",
          ["O-PENDING"] = "0PNDNG",
        }
        return mode_map[s] or s
      end

      local function file_path_with_icon()
        local file_path = vim.fn.expand("%:p:h:t") .. "/" .. vim.fn.expand("%:t")
        return " " .. file_path
      end
      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = fmt_mode,
              icon = { "" },
              separator = { right = "", left = "" },
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              file_path_with_icon,
              separator = "",
              padding = { left = 1, right = 0 },
            },
            {
              "branch",
              icon = { " " },
              separator = "",
              padding = { left = 1, right = 0 },
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
            Snacks.profiler.status(),
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return { fg = Snacks.util.color("Statement") } end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {},
          lualine_z = {
            {
              "location",
              icon = { "", align = "left" },
            },
            {
              "progress",
              icon = { "", align = "left" },
              separator = { right = "", left = "" },
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
      return opts
    end,
  },
}
