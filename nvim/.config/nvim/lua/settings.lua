vim.cmd("set ignorecase smartcase")
vim.cmd("set undofile")
vim.cmd("colorscheme kanagawa")

local api = vim.api

api.nvim_set_keymap("n", "<leader>-", ":split<CR>", {})
api.nvim_set_keymap("n", "<leader>|", ":vsplit<CR>", {})
