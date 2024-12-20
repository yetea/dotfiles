return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinLeave" },
  config = function()
    require("colorful-winsep").setup({
      hi = {
        bg = "#282F3B",
        fg = "#ebcb8b",
      },
    })
  end,
}
