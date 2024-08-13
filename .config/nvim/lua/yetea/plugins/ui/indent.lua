return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#be9db8" },
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
      line_num = {
        enable = true,
        style = "#be9db8"
      },
      blank = {
        enable = true,
        chars = {
          "․",
        },
        style = {
          { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
        },
      },
    })
  end
}
