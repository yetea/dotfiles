return {

  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      bold_keywords = true,
      bright_border = true,
      reduce_blue = true,
      telescope = {
        -- Available styles: `classic`, `flat`.
        style = "classic",
      },
    })
    vim.cmd("colorscheme nordic")
  end,
}
