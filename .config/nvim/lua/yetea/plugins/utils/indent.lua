return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#c0c8d8" },
          { fg = "#c5727a" },
        },
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = "─",
        },
      },
      indent = {
        enable = true
      },
    })
  end
}
