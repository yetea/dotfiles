return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>re",  function() require('refactoring').refactor('Extract Function') end,         mode = "x",          desc = "Refactor: Extract Function" },
    { "<leader>rf",  function() require('refactoring').refactor('Extract Function To File') end, mode = "x",          desc = "Refactor: Extract Function To File" },
    { "<leader>rv",  function() require('refactoring').refactor('Extract Variable') end,         mode = "x",          desc = "Refactor: Extract Variable" },
    { "<leader>rI",  function() require('refactoring').refactor('Inline Function') end,          mode = "n",          desc = "Refactor: Inline Function" },
    { "<leader>ri",  function() require('refactoring').refactor('Inline Variable') end,          mode = { "n", "x" }, desc = "Refactor: Inline Variable" },
    { "<leader>rb",  function() require('refactoring').refactor('Extract Block') end,            mode = "n",          desc = "Refactor: Extract Block" },
    { "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end,    mode = "n",          desc = "Refactor: Extract Block To File" },
  },
  config = function()
    require("refactoring").setup()
  end,
}
