return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      on_highlight = function(highlights, palette)
        highlights.TelescopePromptBorder = {
          fg = "#BBC3D4",
          bg = "#222630",
        }
        highlights.TelescopeResultsBorder = {
          fg = "#BBC3D4",
          bg = "#222630",
        }
        highlights.TelescopePreviewBorder = {
          fg = "#BBC3D4",
          bg = "#222630",
        }
        -- Customize Telescope Results and Preview backgrounds
        highlights.TelescopeResultsNormal = {
          fg = "#BBC3D4",
          bg = "#242933", -- Set the background color to a different gray from the palette
        }
        highlights.TelescopePreviewNormal = {
          fg = "#BBC3D4",
          bg = "#242933", -- Set the background color to a different gray from the palette
        }
      end,
      bold_keywords = true,
      bright_border = true,
      reduce_blue = true,
      telescope = {
        -- Available styles: `classic`, `flat`.
        style = "flat",
      },
    })
    vim.cmd("colorscheme nordic")
  end,
}
