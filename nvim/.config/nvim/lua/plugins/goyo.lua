return {
	"junegunn/goyo.vim",
	config = function()
		vim.api.nvim_create_user_command('Focusify', function()
		vim.cmd('Goyo 60')
		vim.cmd('colorscheme slate')
		vim.cmd('Limelight')
		end,{})
	end
}
