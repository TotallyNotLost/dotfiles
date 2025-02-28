return {
	"junegunn/goyo.vim",
	config = function()
		vim.api.nvim_create_user_command('Focusify', function()
			vim.cmd("Goyo 72")
			vim.cmd("Limelight")
			vim.cmd("colorscheme default")
		end, {})
	end,
}
