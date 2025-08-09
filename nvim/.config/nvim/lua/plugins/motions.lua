return {
	{
		'smoka7/hop.nvim',
		version = "*",
		config = function()
			local hop = require('hop')
			hop.setup()
			vim.keymap.set('', ';', function()
				hop.hint_anywhere()
			end, {remap=true})
			end,
	}
}
