return {
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				bold_keywords = true,
				bright_border = true,
				reduce_blue = true,
			})
			vim.cmd("colorscheme nordic")
		end,
}
