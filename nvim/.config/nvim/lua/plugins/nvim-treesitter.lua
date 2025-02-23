return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "rust", "kotlin", "go", "markdown", "python", "javascript", "c_sharp" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}
