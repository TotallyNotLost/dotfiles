return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
		    vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{ "EdenEast/nightfox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "oxfist/night-owl.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ 'sainnhe/sonokai' },
}
