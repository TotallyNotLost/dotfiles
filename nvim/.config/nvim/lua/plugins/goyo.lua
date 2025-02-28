return {
	"junegunn/goyo.vim",
	config = function()
		vim.api.nvim_create_user_command('Focusify', function()
			vim.cmd("colorscheme slate")
			vim.cmd("Goyo 72")
			vim.cmd("Limelight")
		end, {})
	end,
}
