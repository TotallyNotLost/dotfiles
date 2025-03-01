return {
	"easymotion/vim-easymotion",
	config = function()
		local api = vim.api

		api.nvim_set_keymap("n", " ", "<leader><leader>w", {})
	end
}
