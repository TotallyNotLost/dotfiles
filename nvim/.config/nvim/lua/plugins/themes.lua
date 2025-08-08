return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rebelot/kanagawa.nvim" },
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('onedark').setup {
				style = 'darker'
			}
			-- Enable theme
			require('onedark').load()
		end
	},
	{ 'sainnhe/sonokai' },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {}
	}
}
