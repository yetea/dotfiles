return	{{
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
},	{
  "cjodo/convert.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>cf", "<cmd>ConvertFindNext<CR>", desc = "Find next convertable unit" },
    { "<leader>ci", "<cmd>ConvertFindCurrent<CR>", desc = "Find convertable unit in current line" },
    { "<leader>cx", "<cmd>ConvertAll<CR>", desc = "Convert all of a specified unit" },
  },
}}